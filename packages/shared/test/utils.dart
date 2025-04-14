import 'package:coordinate_systems/coordinate_systems.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared/geoutils/model.dart';

void expectEqualCoordinates(LonLat ll1, LonLat ll2) {
  const delta = 0.0002;
  expect(ll1.lon, closeTo(ll2.lon, delta));
  expect(ll1.lat, closeTo(ll2.lat, delta));
}

void expectEqualPoints(Point p1, Point p2) {
  const delta = 0.0002;
  expect(p1.x, closeTo(p2.x, delta));
  expect(p1.y, closeTo(p2.y, delta));
}
