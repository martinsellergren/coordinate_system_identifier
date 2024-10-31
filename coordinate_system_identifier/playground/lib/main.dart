// ignore_for_file: avoid_print, invalid_use_of_visible_for_testing_member

import 'package:coordinate_system_identifier/home_page/home_page.dart';
import 'package:coordinate_system_identifier/res_dialog/res_dialog.dart';
import 'package:coordinate_systems_data/coordinate_systems_data.dart';
import 'package:coordinate_systems_data/data_model.dart';
import 'package:flutter/material.dart';
import 'package:shared/geoutils/geoutils.dart';

const initialCase = _Case.resDialog;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadCoordinateSystemData();
  LonLatFromPointAndCoordinateSystem.setup();
  runApp(const MaterialApp(home: _Page()));
}

enum _Case {
  home,
  map,
  resDialog,
  copyDialog,
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
            physics: const NeverScrollableScrollPhysics(),
            children: _Case.values
                .map((e) => switch (e) {
                      _Case.home => const HomePage(),
                      _Case.map => ApproximationInputMap(
                          onTap: (lonLat) => print('Tapped map at $lonLat'),
                        ),
                      _Case.resDialog => ResDialog(
                          tappedPoint: const LonLat(lon: 20, lat: 60),
                          pointDetails: getPointDetailsFromCoordinateInput(
                              input: '6097107,356084'),
                        ),
                      _Case.copyDialog => const CopyDialog(
                          lonLat: LonLat(lon: 10.43, lat: 60.54654)),
                    })
                .toList()),
      ),
    );
  }
}
