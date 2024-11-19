import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:separate/separate.dart';
import 'package:shared/context_extension.dart';
import 'package:shared/coordinate_system_data/model.dart';
import 'package:shared/geoutils/coordinates_parsing.dart';
import 'package:shared/geoutils/get_point_details.dart';
import 'package:shared/geoutils/model.dart';
import 'package:shared/my_google_map.dart';

import '../app.dart';
import '../res_dialog/res_dialog.dart';
import 'utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => _showAboutDialog(context),
            icon: const Icon(Icons.info),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: const SizedBox(width: 500, child: _Content()),
      ),
    );
  }
}

void _showAboutDialog(BuildContext context) => showAboutDialog(
      context: context,
      applicationName: appName,
      applicationIcon: const Icon(Icons.place),
      children: [const Text('Enjoy life')],
    );

class _Content extends StatefulWidget {
  const _Content();

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  final _anyCoordinatesInputController = TextEditingController();
  Point? _ambiguousInputPoint;

  @override
  void dispose() {
    _anyCoordinatesInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ambiguousInputPoint = _ambiguousInputPoint;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _Headline(),
        ambiguousInputPoint == null
            ? _AnyCoordinatesTextField(
                controller:
                    _anyCoordinatesInputController, // to preserve text input state
                onEnteredWellDefinedCoordinates: (lonLat) =>
                    context.openInGoogleMaps(lonLat: lonLat),
                onEnteredAmbiguousCoordinates: (point) =>
                    setState(() => _ambiguousInputPoint = point),
              )
            : AmbiguousInputStepper(
                inputPoint: ambiguousInputPoint,
                onUpdateInputPoint: (inputPoint) =>
                    setState(() => _ambiguousInputPoint = inputPoint),
                onCancel: () => setState(() => _ambiguousInputPoint = null),
                onApproximateLocationSelected: (lonLat) => _onMapTap(
                  tapped: lonLat,
                  inputPoint: ambiguousInputPoint,
                ),
              ),
      ].separate((i, e0, e1) => const SizedBox(height: 16)),
    );
  }

  void _onMapTap({
    required LonLat tapped,
    required Point inputPoint,
  }) {
    if (isLikelyWgs84DegreesInDecimalFormat(
        point: inputPoint, approximation: tapped)) {
      context.openInGoogleMaps(
        lonLat: LonLat(
          lon: inputPoint.x,
          lat: inputPoint.y,
        ),
      );
    } else {
      try {
        final details = getPointDetails(point: inputPoint);
        showDialog(
          context: context,
          builder: (context) => AmbiguousResDialog(
            inputPointDetails: details,
            tappedPoint: tapped,
          ),
        );
      } catch (e) {
        setState(() => _ambiguousInputPoint = null);
        context.showSnackBar(
            SnackBar(content: Text('Error processing input, $e')));
      }
    }
  }
}

class _Headline extends StatelessWidget {
  const _Headline();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Coordinates Opener',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _AnyCoordinatesTextField extends StatefulWidget {
  final TextEditingController controller;
  final Function(LonLat lonLat) onEnteredWellDefinedCoordinates;
  final Function(Point point) onEnteredAmbiguousCoordinates;

  const _AnyCoordinatesTextField(
      {required this.onEnteredWellDefinedCoordinates,
      required this.onEnteredAmbiguousCoordinates,
      required this.controller});

  @override
  State<_AnyCoordinatesTextField> createState() =>
      _AnyCoordinatesTextFieldState();
}

class _AnyCoordinatesTextFieldState extends State<_AnyCoordinatesTextField> {
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autofocus: true,
      onChanged: (value) => setState(() => _errorText = null),
      onSubmitted: _onSubmitted,
      decoration: InputDecoration(
        // labelText: 'Enter coordinates in any format or coordinate system',
        helperText: 'Enter coordinates in any format or coordinate system',
        errorText: _errorText,
      ),
    );
  }

  void _onSubmitted(String value) {
    if (value.isEmpty) return;
    try {
      final res = parseCoordinates(value);
      switch (res) {
        case WellDefined():
          widget.onEnteredWellDefinedCoordinates(res.lonLat);
        case Ambiguous():
          widget.onEnteredAmbiguousCoordinates(res.point);
      }
    } catch (e) {
      setState(() => _errorText = 'Bad input, $e');
    }
  }
}

class AmbiguousInputStepper extends StatefulWidget {
  final Point inputPoint;
  final Function() onCancel;
  final Function(Point inputPoint) onUpdateInputPoint;
  final Function(LonLat lonLat) onApproximateLocationSelected;
  final int? initialStepIndex;

  @visibleForTesting
  const AmbiguousInputStepper(
      {super.key,
      required this.onApproximateLocationSelected,
      required this.onCancel,
      required this.inputPoint,
      required this.onUpdateInputPoint,
      this.initialStepIndex});

  @override
  State<AmbiguousInputStepper> createState() => _AmbiguousInputStepperState();
}

class _AmbiguousInputStepperState extends State<AmbiguousInputStepper> {
  final _focusNode = FocusNode()..requestFocus();
  late _Step _currentStep = widget.initialStepIndex != null
      ? _Step.values[widget.initialStepIndex!]
      : _Step.determineXY;

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: (value) => value is KeyDownEvent &&
              value.logicalKey == LogicalKeyboardKey.enter
          ? switch (_currentStep) {
              _Step.enterCoordinates || _Step.enterApproximateLocation => null,
              _Step.determineXY =>
                setState(() => _currentStep = _Step.enterApproximateLocation),
            }
          : null,
      child: SingleChildScrollView(
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Stepper(
            currentStep: _currentStep.index,
            controlsBuilder: switch (_currentStep) {
              _Step.determineXY => null, //i.e default controls
              _Step.enterCoordinates ||
              _Step.enterApproximateLocation =>
                (context, details) => const SizedBox.shrink(),
            },
            onStepCancel: () => widget.onCancel(),
            onStepContinue: () => setState(() => _currentStep =
                _Step.values[_Step.values.indexOf(_currentStep) + 1]),
            onStepTapped: (value) => switch (_Step.values[value]) {
              _Step.enterCoordinates => widget.onCancel(),
              _Step.determineXY ||
              _Step.enterApproximateLocation =>
                setState(() => _currentStep = _Step.values[value]),
            },
            steps: _Step.values
                .map(
                  (e) => switch (e) {
                    _Step.enterCoordinates => const Step(
                        title: Text('Enter coordinates'),
                        content: SizedBox.shrink(),
                      ),
                    _Step.determineXY => Step(
                        title: const Text('Confirm or swap order'),
                        content: _PickXY(
                          inputPoint: widget.inputPoint,
                          onUpdateInputPoint: widget.onUpdateInputPoint,
                        ),
                      ),
                    _Step.enterApproximateLocation => Step(
                        title: const Text('Enter approximate location'),
                        content: _EnterApproximateLocation(
                          onEntered: widget.onApproximateLocationSelected,
                        ),
                      ),
                  },
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

enum _Step {
  enterCoordinates,
  determineXY,
  enterApproximateLocation,
}

class _PickXY extends StatelessWidget {
  final Point inputPoint;
  final Function(Point inputPoint) onUpdateInputPoint;

  const _PickXY({required this.inputPoint, required this.onUpdateInputPoint});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Y/N/latitude: ${inputPoint.y}'),
            Text('X/E/longitude:  ${inputPoint.x}'),
          ],
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: () => onUpdateInputPoint(Point(
            x: inputPoint.y,
            y: inputPoint.x,
          )),
          icon: const Icon(Icons.swap_vert),
        ),
      ],
    );
  }
}

class _EnterApproximateLocation extends StatelessWidget {
  final Function(LonLat lonLat) onEntered;

  const _EnterApproximateLocation({required this.onEntered});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
            '''To locate this point on Earth, we first need to identify its coordinate system from the thousands available. Please provide an approximate location so we can find the best matching coordinate system for your input.'''),
        _Map(onTap: onEntered),
      ].separate((i, e0, e1) => const SizedBox(height: 16)),
    );
  }
}

class _Map extends StatelessWidget {
  final Function(LonLat lonLat) onTap;

  const _Map({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MyGoogleMap(
      cameraTarget: const LonLat(lon: 0, lat: 0),
      zoom: 0,
      onTap: onTap,
    );
  }
}
