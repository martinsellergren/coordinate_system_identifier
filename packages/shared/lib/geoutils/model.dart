import 'package:freezed_annotation/freezed_annotation.dart';

import '../coordinate_system_data/model.dart';

part 'model.freezed.dart';

/// in any coordinate system
@freezed
class Point with _$Point {
  const factory Point({required double x, required double y}) = _Point;
}

@freezed
class PointDetails with _$PointDetails {
  const factory PointDetails({
    required Point point,
    required Map<CoordinateSystem, LonLat> lonLats,
  }) = _PointDetails;
}
