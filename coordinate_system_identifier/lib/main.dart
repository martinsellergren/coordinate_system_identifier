import 'package:coordinate_systems_data/coordinate_systems_data.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'geoutils/geoutils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadCoordinateSystemData();
  LonLatFromPointAndCoordinateSystem.setup();
  runApp(const App());
}
