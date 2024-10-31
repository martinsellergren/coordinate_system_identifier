import 'dart:convert';

import 'package:coordinate_systems_data/data_model.dart';
import 'package:flutter/services.dart';

late final CoordinateSystemsData coordinateSystemsData;

Future<void> loadCoordinateSystemData() async {
  String data = await rootBundle.loadString(
      'packages/coordinate_systems_data/assets/coordinate_systems.json');
  coordinateSystemsData = CoordinateSystemsData.fromJson(jsonDecode(data));
}
