import 'package:flutter/material.dart';
import 'package:shared/geoutils/get_point_details.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetPointDetails();
  runApp(const App());
}
