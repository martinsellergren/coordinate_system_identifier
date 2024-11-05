// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:shared/geoutils/get_point_details.dart';
import 'package:shared/geoutils/model.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await setupGetPointDetails();
  final res = getPointDetails(
    point: const Point(x: 21.75108, y: 54.98906),
  );
  print(
      'res=${res.lonLats.entries.firstWhere((e) => e.key.epsgCode == 4326).value}');
}
