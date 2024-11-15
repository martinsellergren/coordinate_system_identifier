import 'package:flutter_test/flutter_test.dart';
import 'package:shared/coordinate_system_data/model.dart';
import 'package:shared/geoutils/coordinates_parsing.dart';
import 'package:shared/geoutils/model.dart';

import 'utils.dart';

const _treriksroset = LonLat(lon: 20.548645, lat: 69.059973);
const _capeHorn = LonLat(lon: -67.265894, lat: -55.983620);

void main() {
  test(
    "Treriksröset, well defined",
    () {
      [
        '''69°03'35.9"N 20°32'55.1"E''',
        '''69° 03' 35.9" N 20°   32' 55.1" E''',
        '''69° 03' 35.9"  N   ,  20° 32' 55.1" E''',
        '''lat=69.059973, lon=20.548645''',
        '''lat=69,059973 lon=20,548645''',
        '''y: 69,059973 x:20,548645''',
        '''x: 20.548645, y: 69.059973''',
        '''x:20.548645 y = 69.059973''',
        '''69.059973°N 20.548645°E''',
        '''69°3.59838'N 20°32.9187'E''',
        '''lon: 20.548645 lat: 69.059973''',
        '''Latitude: 69.059973 Longitude: 20.548645''',
        '''Longitude: 20.548645latitude: 69.059973''',
        '''34W DB 81997 61115''', // mgrs
        '''34WDB8199761115''',
      ].forEach(
        (e) => expectEqualCoordinates(
          parseCoordinates(e).requireWellDefined,
          _treriksroset,
        ),
      );
    },
  );

  test(
    "Treriksröset, ambiguous",
    () {
      [
        '''69.059973, 20.548645''',
        '''69,059973 20,548645''',
      ].forEach(
        (e) => expectEqualPoints(
          parseCoordinates(e).requireAmbiguous,
          _treriksroset.toPoint,
        ),
      );
    },
  );

  test(
    "Cape horn, well defined",
    () {
      [
        '''55°59'01.0"S 67°15'57.2"W''',
        '''55°  59'01.0" S, 67°15' 57.2" W ''',
        '''lat: -55.983620, lon: -67.265894''',
        '''lon=-67.265894 lat  =  -55.983620''',
      ].forEach(
        (e) => expectEqualCoordinates(
          parseCoordinates(e).requireWellDefined,
          _capeHorn,
        ),
      );
    },
  );
}

extension on CoordinatesParsingResult {
  LonLat get requireWellDefined {
    final ths = this;
    return switch (ths) {
      WellDefined() => ths.lonLat,
      Ambiguous() => throw StateError('Not well defined: $ths'),
    };
  }

  Point get requireAmbiguous {
    final ths = this;
    return switch (ths) {
      WellDefined() => throw StateError('Not ambiguous: $ths'),
      Ambiguous() => ths.point,
    };
  }
}

extension on LonLat {
  Point get toPoint => Point(x: lon, y: lat);
}
