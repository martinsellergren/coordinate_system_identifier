import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
class EpsgJsonResponse with _$EpsgJsonResponse {
  const factory EpsgJsonResponse({
    required Bbox bbox,
  }) = _EpsgJsonResponse;

  factory EpsgJsonResponse.fromJson(Map<String, dynamic> json) =>
      _$EpsgJsonResponseFromJson(json);
}

@freezed
class Bbox with _$Bbox {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Bbox({
    required double southLatitude,
    required double westLongitude,
    required double northLatitude,
    required double eastLongitude,
  }) = _Bbox;

  factory Bbox.fromJson(Map<String, dynamic> json) => _$BboxFromJson(json);
}
