// ignore_for_file: avoid_print

import 'package:coordinate_system_identifier/coordinate_system_data.dart';
import 'package:coordinate_system_identifier/geoutils/geoutils.dart';
import 'package:coordinate_system_identifier/geoutils/model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await loadCoordinateSystemData();
  final coordinateSystem =
      coordinateSystemsData.items.firstWhere((e) => e.epsgCode == 3006);
  LonLatFromPointAndCoordinateSystem.setup();
  final res = LonLatFromPointAndCoordinateSystem.instance.call(
    point: const Point(x: 356083.438, y: 6097106.672),
    coordinateSystem: coordinateSystem,
  );
  print('res=$res');
}

// const _sweref = CoordinateSystem(
//   epsgCode: 3006,
//   name: 'SWEREF99 TM',
//   proj4:
//       '+proj=utm +zone=33 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs +type=crs',
// );
