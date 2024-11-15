import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mgrs_dart/mgrs_dart.dart' as m;
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
  } else if (source.toLowerCase().contains('lat')) {
    return CoordinatesParsingResult.wellDefined(
        lonLat: _parseLabeledDecimalDegrees(source));
  } else if (source.contains(RegExp(r'[C-X]'))) {
    return CoordinatesParsingResult.wellDefined(
        lonLat: _parseWhenSourceContainsLetters(source));
  } else {
    return CoordinatesParsingResult.ambiguous(point: _parseDecimal(source));
  }
}

LonLat _parseDegrees(String source) {
  source = source
      .replaceFirst(RegExp(r'N\s*,'), 'N')
      .replaceFirst(RegExp(r'E\s*,'), 'E')
      .replaceFirst(RegExp(r'S\s*,'), 'S')
      .replaceFirst(RegExp(r'W\s*,'), 'W')
      .replaceAll(RegExp(r'°\s+'), '°')
      .replaceAll(RegExp(r"'\s+"), "'")
      .replaceAll(RegExp(r'"\s+'), '"');
  final res = p.parseCoordinates(source);
  if (res == null) throw const FormatException();
  return LonLat(lon: res.long, lat: res.lat);
}

LonLat _parseLabeledDecimalDegrees(String source) {
  final lon = double.parse(RegExp(r'lon.*?(-?\d+(\.\d+)?)')
      .firstMatch(source.toLowerCase())!
      .group(1)!);
  final lat = double.parse(RegExp(r'lat.*?(-?\d+(\.\d+)?)')
      .firstMatch(source.toLowerCase())!
      .group(1)!);
  return LonLat(lon: lon, lat: lat);
}

LonLat _parseWhenSourceContainsLetters(String source) {
  final res = p.parseCoordinates(source);
  if (res != null) {
    return LonLat(lon: res.long, lat: res.lat);
  }
  final res2 = m.Mgrs.toPoint(source);
  return LonLat(lon: res2.first, lat: res2.last);
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
