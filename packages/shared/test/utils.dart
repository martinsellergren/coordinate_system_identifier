import 'package:flutter_test/flutter_test.dart';
import 'package:shared/coordinate_system_data/model.dart';

void expectEqualCoordinates(LonLat ll1, LonLat ll2) {
  const delta = 0.0002;
  expect(ll1.lon, closeTo(ll2.lon, delta));
  expect(ll1.lat, closeTo(ll2.lat, delta));
}
