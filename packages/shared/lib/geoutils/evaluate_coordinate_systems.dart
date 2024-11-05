import 'package:collection/collection.dart';

import '../coordinate_system_data/model.dart';
import 'geoutils.dart';
import 'model.dart';

typedef CoordinateSystemRes = ({
  CoordinateSystem coordinateSystem,
  double dKm,
  LonLat lonLat,
});

extension PointDetailsEvaluation on PointDetails {
  List<CoordinateSystemRes> coordinateSystemsOrderedByDistance({
    required LonLat reference,
  }) {
    return lonLats.entries.map((e) {
      final d = distanceBetween(lonLat1: e.value, lonLat2: reference);
      final dRoundedKm = double.parse((d * 0.001).toStringAsFixed(0));
      return (
        coordinateSystem: e.key,
        dKm: dRoundedKm,
        lonLat: e.value,
      );
    }).sorted((a, b) => [
          a.dKm.compareTo(b.dKm),
          // a.coordinateSystem.bounds.diagonalLength
          //     .compareTo(b.coordinateSystem.bounds.diagonalLength),
          a.coordinateSystem.name.compareTo(b.coordinateSystem.name)
        ].firstWhere((e) => e != 0, orElse: () => 0));
  }
}
