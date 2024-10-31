import 'package:coordinate_systems_data/coordinate_systems_data.dart';
import 'package:coordinate_systems_data/data_model.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as t;
import 'package:proj4dart/proj4dart.dart' as p;

import '../logger.dart';
import 'model.dart';

PointDetails getPointDetailsFromCoordinateInput({
  required String input,
}) {
  final point = _pointFromInput(input);
  int nSuccess = 0;
  int nErrors = 0;
  final entries = coordinateSystemsData.items
      .map(
        (e) {
          final lonLat = LonLatFromPointAndCoordinateSystem.instance(
              point: point, coordinateSystem: e);
          if (lonLat != null) {
            nSuccess++;
          } else {
            nErrors++;
          }
          return MapEntry(e, lonLat);
        },
      )
      .where((e) => e.value != null)
      .map((e) => MapEntry(e.key, e.value!));
  if (entries.isEmpty) throw TransformException();
  final map = Map.fromEntries(entries);
  logger.i(
      'lonLatFromPointAndCoordinateSystem, nSuccess: $nSuccess, nErrors: $nErrors');
  final res = PointDetails(point: point, lonLats: map);
  return res;
}

class TransformException implements Exception {}

Point _pointFromInput(String input) {
  input = input.trim();
  final parts = input.split(RegExp(r'[,\s]+'));
  if (parts.length != 2) throw const FormatException();
  return Point(
    x: double.parse(parts[1]),
    y: double.parse(parts[0]),
  );
}

class LonLatFromPointAndCoordinateSystem {
  LonLatFromPointAndCoordinateSystem._() {
    _loadProjections();
  }

  static LonLatFromPointAndCoordinateSystem instance =
      LonLatFromPointAndCoordinateSystem._();

  static void setup() => instance;

  void _loadProjections() {
    int nSuccess = 0;
    int nErrors = 0;
    for (final e in coordinateSystemsData.items) {
      try {
        p.Projection.add(e.epsgCode.toString(), e.proj4);
        nSuccess++;
      } catch (error) {
        logger.d('Error registering proj4 definition for ${e.epsgCode}');
        nErrors++;
      }
    }
    logger.i('Load projections, nSuccess: $nSuccess, nErrors: $nErrors');
  }

  LonLat? call({
    required Point point,
    required CoordinateSystem coordinateSystem,
  }) {
    final proj = p.Projection.get('${coordinateSystem.epsgCode}');
    if (proj == null) return null;
    try {
      final res =
          proj.transform(p.Projection.WGS84, p.Point(x: point.x, y: point.y));
      if (!res.x.isFinite) throw 'Longitude is not finite, ${res.x}';
      if (!res.y.isFinite) throw 'Latitude is not finite, ${res.y}';
      final lonLat = LonLat(lon: res.x, lat: res.y);
      if (!coordinateSystem.bounds.contains(lonLat)) {
        return null;
      }
      return lonLat;
    } catch (e) {
      logger.d(
          'Error transforming ($point, epsg=${coordinateSystem.epsgCode}), $e');
      return null;
    }
  }
}

double distanceBetween({required LonLat lonLat1, required LonLat lonLat2}) {
  return t.SphericalUtil.computeDistanceBetween(
          lonLat1.asMapsToolkit, lonLat2.asMapsToolkit)
      .toDouble();
}

extension BoundsX on Bounds {
  bool contains(LonLat lonLat) {
    return lonLat.lon > southWest.lon &&
        lonLat.lat > southWest.lat &&
        lonLat.lon < northEast.lon &&
        lonLat.lat < northEast.lat;
  }

  double get diagonalLength {
    return distanceBetween(lonLat1: northEast, lonLat2: southWest);
  }
}

extension on LonLat {
  t.LatLng get asMapsToolkit => t.LatLng(lat, lon);
}
