import 'dart:convert';

import 'package:flutter/services.dart';

import 'consts.dart';
import 'model.dart';

Future<CoordinateSystemsData> loadCoordinateSystemData() async {
  String str = await rootBundle.loadString(
    // this is only projected coordinate systems
    // e.g degree-based systems (like WGS84) are not included
    'packages/coordinate_systems/assets/coordinate_systems.json',
  );
  var data = CoordinateSystemsData.fromJson(jsonDecode(str));
  return data.copyWith(
    items: [...data.items, wgs84]
        .map((e) => e.proj4.contains('+nadgrids')
            ? e.copyWith(
                proj4: e.proj4.replaceAll(RegExp(r'\+nadgrids=.+? \+'), '+'),
                hasNadgrid: true,
              )
            : e)
        .toList(),
  );
}
