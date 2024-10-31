// ignore_for_file: avoid_print

import 'package:coordinate_systems_data/coordinate_systems_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared/geoutils/geoutils.dart';
import 'package:shared/geoutils/model.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await loadCoordinateSystemData();
  final coordinateSystem =
      coordinateSystemsData.items.firstWhere((e) => e.epsgCode == 4619);
  LonLatFromPointAndCoordinateSystem.setup();
  final res = LonLatFromPointAndCoordinateSystem.instance.call(
    // point: const Point(x: 356083.438, y: 6097106.672),
    point: const Point(x: 21.75108, y: 54.98906),
    coordinateSystem: coordinateSystem,
  );
  print('res=$res');
}
