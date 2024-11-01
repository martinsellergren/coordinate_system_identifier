// ignore_for_file: invalid_use_of_visible_for_testing_member, avoid_print

import 'package:coordinate_systems_data/coordinate_systems_data.dart';
import 'package:coordinate_systems_data/data_model.dart';
import 'package:coordinates_opener/home_page/home_page.dart';
import 'package:coordinates_opener/res_dialog/pick_reference_system_dialog.dart';
import 'package:coordinates_opener/res_dialog/res_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared/geoutils/geoutils.dart';
import 'package:shared/geoutils/model.dart';

const _initialCase = _Case.pickReferenceSystemDialog;

enum _Case {
  home,
  stepper,
  ambiguousResDialog,
  pickReferenceSystemDialog,
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadCoordinateSystemData();
  runApp(const MaterialApp(home: _Page()));
}

class _Page extends StatefulWidget {
  const _Page();

  @override
  State<_Page> createState() => _PageState();
}

class _PageState extends State<_Page> {
  _Case _currentCase = _initialCase;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _Case.values.length,
      initialIndex: _initialCase.index,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              onTap: (value) =>
                  setState(() => _currentCase = _Case.values[value]),
              tabs: _Case.values.map((e) => Tab(text: e.name)).toList()),
        ),
        body: switch (_currentCase) {
          _Case.home => const HomePage(),
          _Case.stepper => Center(
              child: SizedBox(
                width: 500,
                child: LocationInputStepper(
                  onMapTap: (lonLat) => print('Tapped $lonLat'),
                  onCancel: () {},
                ),
              ),
            ),
          _Case.ambiguousResDialog => () {
              final dialog = AmbiguousResDialog(
                inputPointDetails:
                    getPointDetails(point: const Point(x: 20, y: 60)),
                tappedPoint: const LonLat(lat: 20, lon: 60),
              );
              return ListView(
                children: [
                  TextButton(
                      onPressed: () => showDialog(
                          context: context, builder: (context) => dialog),
                      child: const Text('show')),
                  dialog,
                ],
              );
            }(),
          _Case.pickReferenceSystemDialog => () {
              final dialog = PickReferenceSystemDialog(
                pointDetails: getPointDetails(point: const Point(x: 20, y: 60)),
                tappedPoint: const LonLat(lat: 20, lon: 60),
                onPicked: (pickedCoordinateSystem) {},
              );
              return Column(
                children: [
                  TextButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => dialog,
                    ),
                    child: const Text('show'),
                  ),
                  Expanded(child: dialog),
                ],
              );
            }(),
        },
      ),
    );
  }
}
