import 'package:flutter/material.dart';

import 'app.dart';
import 'coordinate_system_data.dart';
import 'geoutils/geoutils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadCoordinateSystemData();
  LonLatFromPointAndCoordinateSystem.setup();
  runApp(const App());
}
