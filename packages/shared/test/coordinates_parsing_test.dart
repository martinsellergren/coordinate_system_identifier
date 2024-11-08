import 'package:flutter_test/flutter_test.dart';
import 'package:shared/coordinate_system_data/model.dart';
import 'package:shared/geoutils/coordinates_parsing.dart';

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
        '''lon: 20.548645 lat: 69.059973''',
        '''Latitude: 69.059973 Longitude: 20.548645''',
        '''Longitude: 20.548645latitude: 69.059973''',
      ].forEach(
        (e) => expectEqualCoordinates(
          parseCoordinates(e).requireWellDefined,
          _treriksroset,
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
}
