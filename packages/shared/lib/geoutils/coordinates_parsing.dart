import 'package:coordinate_systems_data/data_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
  if (source.contains('°')) {
    return const CoordinatesParsingResult.wellDefined(
        lonLat: LonLat(lon: 0, lat: 0));
  } else {
    source = source.trim();
    final parts = source.split(RegExp(r'[,\s]+'));
    if (parts.length != 2) throw const FormatException();
    return CoordinatesParsingResult.ambiguous(
      point: Point(
        x: double.parse(parts[1]),
        y: double.parse(parts[0]),
      ),
    );
  }
}
