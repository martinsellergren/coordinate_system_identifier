// ignore_for_file: avoid_print, invalid_use_of_visible_for_testing_member

import 'package:coordinate_system_identifier/coordinate_system_data.dart';
import 'package:coordinate_system_identifier/geoutils/geoutils.dart';
import 'package:coordinate_system_identifier/home_page/home_page.dart';
import 'package:coordinate_systems_data/data_model.dart';
import 'package:flutter/material.dart';

const initialCase = _Case.resDialog;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadCoordinateSystemData(fromOutside: true);
  LonLatFromPointAndCoordinateSystem.setup();
  runApp(const MaterialApp(home: _Page()));
}

enum _Case {
  home,
  map,
  resDialog,
}

class _Page extends StatelessWidget {
  const _Page();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: initialCase.index,
      length: _Case.values.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: _Case.values.map((e) => Tab(text: e.name)).toList(),
          ),
        ),
        body: TabBarView(
            children: _Case.values
                .map((e) => switch (e) {
                      _Case.home => const HomePage(),
                      _Case.map => Map(
                          onTap: (lonLat) => print('Tapped map at $lonLat'),
                        ),
                      _Case.resDialog => ResDialog(
                          tappedPoint: const LonLat(lon: 20, lat: 60),
                          pointDetails: getPointDetailsFromCoordinateInput(
                              input: '6097107,356084'),
                        ),
                    })
                .toList()),
      ),
    );
  }
}
