import 'dart:convert';

import 'package:coordinate_systems_data/consts.dart';
import 'package:coordinate_systems_data/data_model.dart';
import 'package:flutter/services.dart';

late final CoordinateSystemsData coordinateSystemsData;

Future<void> loadCoordinateSystemData() async {
  String str = await rootBundle.loadString(
    // this is only projected coordinate systems
    // e.g degree-based systems (like WGS84) are not included
    'packages/coordinate_systems_data/assets/coordinate_systems.json',
  );
  final data = CoordinateSystemsData.fromJson(jsonDecode(str));
  coordinateSystemsData = data.copyWith(items: data.items.toList()..add(wgs84));
}
