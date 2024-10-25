import 'package:collection/collection.dart';
import 'package:coordinate_systems_data/data_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:separate/separate.dart';

import '../app.dart';
import '../geoutils/geoutils.dart';
import '../geoutils/model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => showAboutDialog(context: context),
            icon: const Icon(Icons.info),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: SizedBox(
            width: 500,
            child: Column(
              children: [
                const _Headline(),
                const _WelcomeText(),
                const _Stepper(),
              ].separate((i, e0, e1) => const SizedBox(height: 24)),
            ),
          ),
        ),
      ),
    );
  }
}

class _Headline extends StatelessWidget {
  const _Headline();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Welcome to this Coordinate system identifier',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _WelcomeText extends StatelessWidget {
  const _WelcomeText();

  @override
  Widget build(BuildContext context) {
    return const Text(
        "Use this tool when you have some coordinates but don't know in which coordinate system they are defined.");
  }
}

class _Stepper extends StatefulWidget {
  const _Stepper();

  @override
  State<_Stepper> createState() => _StepperState();
}

class _StepperState extends State<_Stepper> {
  int _currentStep = 0;
  PointDetails? _inputPointDetails;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _currentStep,
      controlsBuilder: (context, details) => const SizedBox.shrink(),
      onStepTapped: (value) => switch (_Step.values[value]) {
        _Step.enterCoordinates => setState(() => _currentStep = 0),
        _Step.enterMapPoint => null,
      },
      steps: _Step.values
          .map((e) => switch (e) {
                _Step.enterCoordinates => Step(
                    title: const Text('Enter coordinates'),
                    content: _EnterCoordinatesTextField(
                      onInputAccepted: (res) => setState(() {
                        _inputPointDetails = res;
                        _currentStep = 1;
                      }),
                    ),
                  ),
                _Step.enterMapPoint => Step(
                    title: const Text('Enter approximate location'),
                    content: _Map(
                      onTap: (lonLat) => showDialog(
                        context: context,
                        builder: (context) => _ResDialog(
                          tappedPoint: lonLat,
                          inputPointDetails: _inputPointDetails!,
                        ),
                      ),
                    ),
                  ),
              })
          .toList(),
    );
  }
}

enum _Step {
  enterCoordinates,
  enterMapPoint,
}

class _EnterCoordinatesTextField extends StatefulWidget {
  final Function(PointDetails res) onInputAccepted;

  const _EnterCoordinatesTextField({required this.onInputAccepted});

  @override
  State<_EnterCoordinatesTextField> createState() =>
      _EnterCoordinatesTextFieldState();
}

class _EnterCoordinatesTextFieldState
    extends State<_EnterCoordinatesTextField> {
  late final TextEditingController _controller = TextEditingController();
  String? _errorMessage;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, child) => TextField(
        controller: _controller,
        onChanged: (value) => setState(() => _errorMessage = null),
        onSubmitted: _onSubmitted,
        decoration: InputDecoration(
          errorText: _errorMessage,
          suffix: _controller.text.isEmpty
              ? null
              : IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () => _onSubmitted(_controller.text),
                ),
        ),
      ),
    );
  }

  void _onSubmitted(String value) {
    if (value.isEmpty) return;
    try {
      final res = getPointDetailsFromCoordinateInput(input: value);
      widget.onInputAccepted(res);
    } catch (e) {
      setState(() {
        _errorMessage = 'Error handling input\n$e';
      });
    }
  }
}

class _EnterCoordinatesButton extends StatefulWidget {
  final String Function() getCoordinateInput;
  final Function(PointDetails res) onInputAccepted;

  const _EnterCoordinatesButton(
      {required this.onInputAccepted, required this.getCoordinateInput});

  @override
  State<_EnterCoordinatesButton> createState() =>
      _EnterCoordinatesButtonState();
}

class _EnterCoordinatesButtonState extends State<_EnterCoordinatesButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Text('Continue'),
    );
  }
}

class _Map extends StatelessWidget {
  final Function(LonLat lonLat) onTap;

  const _Map({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: GoogleMap(
        initialCameraPosition: const CameraPosition(target: LatLng(0, 0)),
        onTap: (argument) =>
            onTap(LonLat(lon: argument.longitude, lat: argument.latitude)),
      ),
    );
  }
}

class _ResDialog extends StatefulWidget {
  final LonLat tappedPoint;
  final PointDetails inputPointDetails;

  const _ResDialog(
      {required this.tappedPoint, required this.inputPointDetails});

  @override
  State<_ResDialog> createState() => _ResDialogState();
}

class _ResDialogState extends State<_ResDialog> {
  late final _items = _coordinateSystemsOrderedByDistance();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        const _Tile(
          cell1: Text('Name'),
          cell2: Text('WGS84 (EPSG:4326)'),
          cell3: Text('Distance from approximation'),
        ),
        ..._items.take(20).map((e) => _Tile(
              cell1: TextButton(
                onPressed: () => context
                    .openUrl('https://epsg.io/${e.coordinateSystem.epsgCode}'),
                child: Text(
                  '${e.coordinateSystem.name} (${e.coordinateSystem.epsgCode})',
                ),
              ),
              cell2: TextButton(
                onPressed: () => context.openUrl(
                    'https://maps.google.com/?q=${e.lonLat.lat},${e.lonLat.lon}'),
                child: Text('${e.lonLat}'),
              ),
              cell3: Text('${e.d * 0.001}km'),
            )),
      ],
    );
  }

  List<({CoordinateSystem coordinateSystem, double d, LonLat lonLat})>
      _coordinateSystemsOrderedByDistance() {
    return widget.inputPointDetails.lonLats.entries.map((e) {
      final d = distanceBetween(lonLat1: e.value, lonLat2: widget.tappedPoint);
      return (
        coordinateSystem: e.key,
        d: d ?? double.infinity,
        lonLat: e.value,
      );
    }).sorted((a, b) => a.d.compareTo(b.d));
  }
}

class _Tile extends StatelessWidget {
  final Widget cell1;
  final Widget cell2;
  final Widget cell3;

  const _Tile({required this.cell1, required this.cell2, required this.cell3});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 4, child: Center(child: cell1)),
        Expanded(flex: 3, child: Center(child: cell2)),
        Expanded(flex: 3, child: Center(child: cell3)),
      ],
    );
  }
}
