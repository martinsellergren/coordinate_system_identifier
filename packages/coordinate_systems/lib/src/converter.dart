import 'package:coordinate_systems_model/coordinate_systems_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proj4dart/proj4dart.dart' as p;

import 'load.dart';

part 'converter.freezed.dart';

@freezed
class GeoPoint with _$GeoPoint {
  const factory GeoPoint({
    required double x,
    required double y,
    required int epsgCode,
  }) = _GeoPoint;
}

@freezed
class ConvertResult with _$ConvertResult {
  const factory ConvertResult({
    required GeoPoint point,

    /// If false, the result may be slightly inaccurate because transformations
    /// with meter-level accuracy for this coordinate system is not supported.
    /// It's because the coordinate system uses NADGRIDs.
    required bool isExact,
  }) = _ConvertResult;
}

class CoordinatesConverter {
  final CoordinateSystemsData coordinateSystemData;

  CoordinatesConverter({required this.coordinateSystemData});

  static Future<CoordinatesConverter> create() async {
    final coordinateSystemsData = await loadCoordinateSystemData();
    await _loadProjProjections(data: coordinateSystemsData);
    return CoordinatesConverter(coordinateSystemData: coordinateSystemsData);
  }

  ConvertResult call({required GeoPoint source, required int epsgCode}) {
    final proj = p.Projection.get('${source.epsgCode}');
    if (proj == null) {
      throw 'Unsupported coordinate system ${source.epsgCode}';
    }
    final res = p.Projection.WGS84.transform(
      proj,
      p.Point(x: source.x, y: source.y),
    );
    return ConvertResult(
      point: GeoPoint(x: res.x, y: res.y, epsgCode: epsgCode),
      isExact:
          !coordinateSystemData.items
              .firstWhere((e) => e.epsgCode == epsgCode)
              .hasNadgrid,
    );
  }
}

Future<void> _loadProjProjections({required CoordinateSystemsData data}) async {
  int nSuccess = 0;
  int nErrors = 0;
  for (final e in data.items) {
    try {
      p.Projection.add(e.epsgCode.toString(), e.proj4);
      nSuccess++;
    } catch (error) {
      // debugPrint('Error registering proj4 definition for ${e.epsgCode}');
      nErrors++;
    }
  }
  debugPrint('Load projections, nSuccess: $nSuccess, nErrors: $nErrors');
}
