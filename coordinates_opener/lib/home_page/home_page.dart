import 'package:coordinate_systems_data/data_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared/geoutils/coordinates_parsing.dart';
import 'package:shared/geoutils/geoutils.dart';
import 'package:shared/geoutils/model.dart';

import '../app.dart';
import '../res_dialog/res_dialog.dart';
import 'utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
  PointDetails? _ambiguousInputPointDetails;

  @override
  void dispose() {
    _anyCoordinatesInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ambiguousInputPointDetails = _ambiguousInputPointDetails;
    return ambiguousInputPointDetails == null
        ? Center(
            child: _AnyCoordinatesTextField(
              controller:
                  _anyCoordinatesInputController, // to preserve text input state
              onEnteredWellDefinedCoordinates: (lonLat) =>
                  context.openInGoogleMaps(lonLat: lonLat),
              onEnteredAmbiguousCoordinates: (point) =>
                  setState(() => _ambiguousInputPointDetails = point),
            ),
          )
        : LocationInputStepper(
            onCancel: () => setState(() => _ambiguousInputPointDetails = null),
            onMapTap: (lonLat) => isLikelyWgs84DegreesInDecimalFormat(
              point: ambiguousInputPointDetails.point,
              approximation: lonLat,
            )
                ? context.openInGoogleMaps(
                    lonLat: LonLat(
                    lon: ambiguousInputPointDetails.point.x,
                    lat: ambiguousInputPointDetails.point.y,
                  ))
                : showDialog(
                    context: context,
                    builder: (context) => AmbiguousResDialog(
                      inputPointDetails: ambiguousInputPointDetails,
                      tappedPoint: lonLat,
                    ),
                  ),
          );
  }
}

class _AnyCoordinatesTextField extends StatefulWidget {
  final TextEditingController controller;
  final Function(LonLat lonLat) onEnteredWellDefinedCoordinates;
  final Function(PointDetails pointDetails) onEnteredAmbiguousCoordinates;

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
          widget.onEnteredAmbiguousCoordinates(
            getPointDetails(point: res.point),
          );
      }
    } catch (e) {
      setState(() => _errorText = 'Bad input, $e');
    }
  }
}

class LocationInputStepper extends StatelessWidget {
  final Function() onCancel;
  final Function(LonLat lonLat) onMapTap;

  @visibleForTesting
  const LocationInputStepper(
      {super.key, required this.onMapTap, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stepper(
        currentStep: 1,
        controlsBuilder: (context, details) => const SizedBox.shrink(),
        onStepTapped: (value) => value == 0 ? onCancel() : null,
        steps: [
          const Step(
            title: Text('Enter coordinates'),
            content: SizedBox.shrink(),
          ),
          Step(
            title: const Text('Enter approximate location'),
            content: _Map(onTap: onMapTap),
          ),
        ],
      ),
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
        onTap: (argument) => onTap(LonLat(
          lon: argument.longitude,
          lat: argument.latitude,
        )),
      ),
    );
  }
}
