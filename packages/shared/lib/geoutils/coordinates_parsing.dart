import 'package:collection/collection.dart';
import 'package:coordinate_systems/coordinate_systems.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mgrs_dart/mgrs_dart.dart' as m;
import 'package:parse_coordinates/parse_coordinates.dart' as p;

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
  source = source
      .trim()
      .evaluateTransformFromEuropeanStyleDecimalNotation()
      .replaceAll(RegExp(r' +'), ' ');
  if (source.contains('°')) {
    return CoordinatesParsingResult.wellDefined(lonLat: _parseDegrees(source));
  } else if (source.toLowerCase().contains('lat')) {
    return CoordinatesParsingResult.wellDefined(
        lonLat: _parseLonLatLabeledDecimalDegrees(source));
  } else if (source.toLowerCase().contains(RegExp(r'x ?[:=]'))) {
    return CoordinatesParsingResult.ambiguous(
        point: _parseXyLabeledDecimalDegrees(source));
  } else if (source.toLowerCase().contains(RegExp(r'[\s,][nesw][\s:=]'))) {
    return CoordinatesParsingResult.ambiguous(
        point: _parseNeswLabeledDecimalDegrees(source));
  } else if (source.toLowerCase().contains(RegExp(r'[a-z]'))) {
    return CoordinatesParsingResult.wellDefined(
        lonLat: _parseWhenSourceContainsLetters(source));
  } else {
    return CoordinatesParsingResult.ambiguous(point: _parseDecimal(source));
  }
}

LonLat _parseDegrees(String source) {
  final e = source.dirCoordinate(dir: 'E');
  final w = source.dirCoordinate(dir: 'W');
  final n = source.dirCoordinate(dir: 'N');
  final s = source.dirCoordinate(dir: 'S');
  return LonLat(
    lon: e?.parseDecimalDegrees() ?? -w!.parseDecimalDegrees(),
    lat: n?.parseDecimalDegrees() ?? -s!.parseDecimalDegrees(),
  );
}

extension on String {
  String? dirCoordinate({required String dir}) =>
      RegExp(r'''([\d°'"\s\.]+)''' + dir.toLowerCase())
          .firstMatch(toLowerCase())
          ?.group(1)
          ?.trim();

  double parseDecimalDegrees() {
    final res = [
      r'([\d\.]+)°',
      r"([\d\.]+)'",
      r'([\d\.]+)"',
    ]
        .map((e) => RegExp(e).firstMatch(this)?.group(1))
        .map((e) => e == null ? null : double.parse(e))
        .toList();
    final deg = res[0]!;
    final min = res[1];
    final sec = res[2];
    return [
      deg,
      if (min != null) min / 60,
      if (sec != null) sec / 3600,
    ].sum;
  }
}

LonLat _parseLonLatLabeledDecimalDegrees(String source) {
  final lon = double.parse(RegExp(r'lon.*?(-?\d+(\.\d+)?)')
      .firstMatch(source.toLowerCase())!
      .group(1)!);
  final lat = double.parse(RegExp(r'lat.*?(-?\d+(\.\d+)?)')
      .firstMatch(source.toLowerCase())!
      .group(1)!);
  return LonLat(lon: lon, lat: lat);
}

Point _parseXyLabeledDecimalDegrees(String source) {
  final x = double.parse(RegExp(r'x ?[:=].*?(-?\d+(\.\d+)?)')
      .firstMatch(source.toLowerCase())!
      .group(1)!);
  final y = double.parse(RegExp(r'y ?[:=].*?(-?\d+(\.\d+)?)')
      .firstMatch(source.toLowerCase())!
      .group(1)!);
  return Point(x: x, y: y);
}

Point _parseNeswLabeledDecimalDegrees(String source) {
  final nesw = ['n', 'e', 's', 'w']
      .map((e) => RegExp(e + r'[:=\s]+(-?[\d\.]+)')
          .firstMatch(source.toLowerCase())
          ?.group(1))
      .map((e) => e == null ? null : double.parse(e))
      .toList();
  return Point(
    y: nesw[0] ?? -nesw[2]!,
    x: nesw[1] ?? -nesw[3]!,
  );
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

extension on String {
  String evaluateTransformFromEuropeanStyleDecimalNotation() {
    if (characters.where((e) => e == ',').length > 1) {
      return replaceAll(',', '.');
    } else {
      return this;
    }
  }
}
