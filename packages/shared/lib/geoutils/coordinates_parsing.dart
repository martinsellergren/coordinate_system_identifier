import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:parse_coordinates/parse_coordinates.dart' as p;

import '../coordinate_system_data/model.dart';
import 'model.dart';

part 'coordinates_parsing.freezed.dart';

@freezed
sealed class CoordinatesParsingResult with _$CoordinatesParsingResult {
  const factory CoordinatesParsingResult.wellDefined({
    required LonLat lonLat,
  }) = WellDefined;

  const factory CoordinatesParsingResult.ambiguous({
    required Point point,
  }) = Ambiguous;
}

CoordinatesParsingResult parseCoordinates(String source) {
  source = source.trim();
  if (source.contains('°')) {
    return CoordinatesParsingResult.wellDefined(lonLat: _parseDegrees(source));
  } else if (source.contains(RegExp(r'[C-X]'))) {
    return CoordinatesParsingResult.wellDefined(lonLat: _parseUtm(source));
  } else {
    return CoordinatesParsingResult.ambiguous(point: _parseDecimal(source));
  }
}

LonLat _parseDegrees(String source) {
  final res = p.parseCoordinates(source);
  if (res == null) throw const FormatException();
  return LonLat(lon: res.long, lat: res.lat);
}

LonLat _parseUtm(String source) {
  final res = p.parseCoordinates(source);
  if (res == null) throw const FormatException();
  return LonLat(lon: res.long, lat: res.lat);
}

Point _parseDecimal(String source) {
  source = source.trim();
  final parts = source.split(RegExp(r'[,\s]+'));
  if (parts.length != 2) throw const FormatException();
  return Point(
    x: double.parse(parts[1]),
    y: double.parse(parts[0]),
  );
}
