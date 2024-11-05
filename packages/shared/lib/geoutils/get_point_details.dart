import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:proj4dart/proj4dart.dart' as p;

import '../coordinate_system_data/consts.dart';
import '../coordinate_system_data/model.dart';
import '../logger.dart';
import 'geoutils.dart';
import 'model.dart';

late final GetPointDetails getPointDetails;

Future<void> setupGetPointDetails() async {
  getPointDetails = await GetPointDetails._create();
}

class GetPointDetails {
  GetPointDetails._();

  static Future<GetPointDetails> _create() async {
    await _loadProjNadgrids();
    await _loadCoordinateSystemData();
    await _loadProjProjections();
    return GetPointDetails._();
  }

  PointDetails call({required Point point}) {
    int nSuccess = 0;
    int nErrors = 0;
    final entries = _coordinateSystemsData.items
        .map(
          (e) {
            final lonLat = _lonLatFromPointAndCoordinateSystem(
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
}

class TransformException implements Exception {}

late final CoordinateSystemsData _coordinateSystemsData;

Future<void> _loadCoordinateSystemData() async {
  String str = await rootBundle.loadString(
    // this is only projected coordinate systems
    // e.g degree-based systems (like WGS84) are not included
    'packages/shared/assets/coordinate_systems.json',
  );
  final data = CoordinateSystemsData.fromJson(jsonDecode(str));
  _coordinateSystemsData =
      data.copyWith(items: data.items.toList()..add(wgs84));
}

Future<void> _loadProjProjections() async {
  int nSuccess = 0;
  int nErrors = 0;
  for (final e in _coordinateSystemsData.items) {
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

Future<void> _loadProjNadgrids() async {
  final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
  final assets = manifest
      .listAssets()
      .where((e) => e.startsWith('packages/shared/assets/nadgrids/'));
  for (final e in assets) {
    final bytes = (await rootBundle.load(e)).buffer.asUint8List();
    p.Projection.nadgrid(
        e.replaceFirst('packages/shared/assets/nadgrids/', ''), bytes);
  }
}

LonLat? _lonLatFromPointAndCoordinateSystem({
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
  } catch (e, s) {
    e.toString().toLowerCase().contains('unable to find mandatory grid')
        ? logger.e('Missing grid shift file', error: e, stackTrace: s)
        : logger.d(
            'Error transforming ($point, epsg=${coordinateSystem.epsgCode}), $e');
    return null;
  }
}
