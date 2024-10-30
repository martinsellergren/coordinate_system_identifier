import 'dart:convert';

import 'package:coordinate_systems_data/data_model.dart';
import 'package:flutter/services.dart';

late final CoordinateSystemsData coordinateSystemsData;

Future<void> loadCoordinateSystemData({bool fromOutside = false}) async {
  String data = await rootBundle.loadString(
    fromOutside
        ? 'packages/coordinate_system_identifier/assets/coordinate_systems.json'
        : 'assets/coordinate_systems.json',
  );
  coordinateSystemsData = CoordinateSystemsData.fromJson(jsonDecode(data));
}
