// ignore_for_file: invalid_use_of_visible_for_testing_member, avoid_print

import 'package:coordinates_opener/home_page/home_page.dart';
import 'package:coordinates_opener/res_dialog/pick_reference_system_dialog.dart';
import 'package:coordinates_opener/res_dialog/res_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared/coordinate_system_data/model.dart';
import 'package:shared/geoutils/get_point_details.dart';
import 'package:shared/geoutils/model.dart';

const _initialCase = _Case.ambiguousResDialogLoadingScreen;

enum _Case {
  home,
  stepper1,
  stepper2,
  ambiguousResDialog,
  ambiguousResDialogNadgrid,
  ambiguousResDialogLoadingScreen,
  pickReferenceSystemDialog,
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetPointDetails();
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
        body: KeyedSubtree(
          key: ValueKey(_currentCase),
          child: switch (_currentCase) {
            _Case.home => const HomePage(),
            _Case.stepper1 => Center(
                child: SizedBox(
                  width: 500,
                  child: AmbiguousInputStepper(
                    onApproximateLocationSelected: (lonLat) =>
                        print('Tapped $lonLat'),
                    onCancel: () {},
                    inputPoint: const Point(x: 20, y: 60),
                    onUpdateInputPoint: (inputPoint) {},
                    initialStepIndex: 1,
                  ),
                ),
              ),
            _Case.stepper2 => Center(
                child: SizedBox(
                  width: 500,
                  child: AmbiguousInputStepper(
                    onApproximateLocationSelected: (lonLat) =>
                        print('Tapped $lonLat'),
                    onCancel: () {},
                    inputPoint: const Point(x: 20, y: 60),
                    onUpdateInputPoint: (inputPoint) {},
                    initialStepIndex: 2,
                  ),
                ),
              ),
            _Case.ambiguousResDialog => _Dialog(
                child: AmbiguousResDialog(
                  inputPointDetails:
                      getPointDetails(point: const Point(x: 20, y: 60)),
                  tappedPoint: const LonLat(lat: 20, lon: 60),
                  showDummyLoadingScreen: false,
                ),
              ),
            _Case.ambiguousResDialogNadgrid => _Dialog(
                child: AmbiguousResDialog(
                  inputPointDetails: getPointDetails(
                    point: const Point(
                        x: 529576.7297772487, y: 180648.18765034562),
                  ),
                  tappedPoint: const LonLat(lon: -0.134211, lat: 51.509913),
                  showDummyLoadingScreen: false,
                ),
              ),
            _Case.ambiguousResDialogLoadingScreen => _Dialog(
                child: AmbiguousResDialog(
                  inputPointDetails:
                      getPointDetails(point: const Point(x: 20, y: 60)),
                  tappedPoint: const LonLat(lat: 20, lon: 60),
                  showDummyLoadingScreen: true,
                ),
              ),
            _Case.pickReferenceSystemDialog => () {
                final dialog = PickReferenceSystemDialog(
                  pointDetails:
                      getPointDetails(point: const Point(x: 20, y: 60)),
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
      ),
    );
  }
}

class _Dialog extends StatelessWidget {
  final Widget child;

  const _Dialog({required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) => child,
      ),
      child: child,
    );
  }
}
