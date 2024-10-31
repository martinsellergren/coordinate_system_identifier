import 'package:coordinate_systems_data/data_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:separate/separate.dart';
import 'package:shared/geoutils/geoutils.dart';
import 'package:shared/geoutils/model.dart';

import '../res_dialog/res_dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => showAboutDialog(
              context: context,
              applicationName: 'Coordinate system identifier',
              applicationIcon: const Icon(Icons.place),
              children: [const Text('Enjoy life')],
            ),
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
                    content: ApproximationInputMap(
                      onTap: (lonLat) => showDialog(
                        context: context,
                        builder: (context) => ResDialog(
                          tappedPoint: lonLat,
                          pointDetails: _inputPointDetails!,
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
          helperText: 'north east',
        ),
      ),
    );
  }

  void _onSubmitted(String value) {
    value = value.trim();
    if (value.isEmpty) return;
    try {
      final res = getPointDetailsFromCoordinateInput(input: value);
      widget.onInputAccepted(res);
    } catch (e) {
      setState(() {
        _errorMessage = 'Bad input, $e';
      });
    }
  }
}

class ApproximationInputMap extends StatelessWidget {
  final Function(LonLat lonLat) onTap;

  @visibleForTesting
  const ApproximationInputMap({super.key, required this.onTap});

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
