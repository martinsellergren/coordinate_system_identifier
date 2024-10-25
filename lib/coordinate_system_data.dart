import 'dart:convert';

import 'package:coordinate_systems_data/data_model.dart';
import 'package:flutter/services.dart';

late final CoordinateSystemsData coordinateSystemsData;

Future<void> loadCoordinateSystemData() async {
  String data = await rootBundle.loadString("assets/coordinate_systems.json");
  coordinateSystemsData = CoordinateSystemsData.fromJson(jsonDecode(data));
  // coordinateSystemsData = const CoordinateSystemsData(
  //   items: [
  //     CoordinateSystem(
  //       epsgCode: 3006,
  //       name: 'SWEREF99 TM',
  //       proj4:
  //           '+proj=utm +zone=33 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs +type=crs',
  //     ),
  //   ],
  // );
}
