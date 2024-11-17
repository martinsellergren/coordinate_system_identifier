import 'package:flutter/material.dart';
import 'package:shared/geoutils/get_point_details.dart';
import 'package:shared/setup_firebase.dart';

import 'app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupFirebase(options: DefaultFirebaseOptions.currentPlatform);
  await setupGetPointDetails();
  runApp(const App());
}
