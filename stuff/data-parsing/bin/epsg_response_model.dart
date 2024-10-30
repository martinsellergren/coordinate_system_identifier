import 'package:freezed_annotation/freezed_annotation.dart';

part 'epsg_response_model.freezed.dart';
part 'epsg_response_model.g.dart';

@freezed
class EpsgJsonResponse with _$EpsgJsonResponse {
  const factory EpsgJsonResponse({
    required BboxResp bbox,
    @JsonKey(name: 'coordinate_system') CoordinateSystemResp? coordinateSystem,
  }) = _EpsgJsonResponse;

  factory EpsgJsonResponse.fromJson(Map<String, dynamic> json) =>
      _$EpsgJsonResponseFromJson(json);
}

@freezed
class BboxResp with _$BboxResp {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BboxResp({
    required double southLatitude,
    required double westLongitude,
    required double northLatitude,
    required double eastLongitude,
  }) = _Bbox;

  factory BboxResp.fromJson(Map<String, dynamic> json) =>
      _$BboxRespFromJson(json);
}

@freezed
class CoordinateSystemResp with _$CoordinateSystemResp {
  const factory CoordinateSystemResp({
    List<AxisResp>? axis,
  }) = _CoordinateSystemResp;

  factory CoordinateSystemResp.fromJson(Map<String, dynamic> json) =>
      _$CoordinateSystemRespFromJson(json);
}

@freezed
class AxisResp with _$AxisResp {
  const factory AxisResp({
    Object? unit,
  }) = _AxisResp;

  factory AxisResp.fromJson(Map<String, dynamic> json) =>
      _$AxisRespFromJson(json);
}
