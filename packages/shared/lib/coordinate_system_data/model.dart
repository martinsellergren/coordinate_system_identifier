import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
class CoordinateSystemsData with _$CoordinateSystemsData {
  const factory CoordinateSystemsData({
    required List<CoordinateSystem> items,
  }) = _Data;

  factory CoordinateSystemsData.fromJson(Map<String, dynamic> json) =>
      _$CoordinateSystemsDataFromJson(json);
}

@freezed
class CoordinateSystem with _$CoordinateSystem {
  const factory CoordinateSystem({
    required int epsgCode,
    required String name,
    required String proj4,
    required Bounds bounds,
  }) = _CoordinateSystem;

  factory CoordinateSystem.fromJson(Map<String, dynamic> json) =>
      _$CoordinateSystemFromJson(json);
}

@freezed
class Bounds with _$Bounds {
  const factory Bounds({
    required LonLat northEast,
    required LonLat southWest,
  }) = _Bounds;

  factory Bounds.fromJson(Map<String, dynamic> json) => _$BoundsFromJson(json);
}

/// WGS84
@freezed
class LonLat with _$LonLat {
  const factory LonLat({
    required double lon,
    required double lat,
  }) = _LonLat;

  factory LonLat.fromJson(Map<String, dynamic> json) => _$LonLatFromJson(json);
}
