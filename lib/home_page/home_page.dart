import 'package:collection/collection.dart';
import 'package:coordinate_systems_data/data_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
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
                    content: Map(
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

class Map extends StatelessWidget {
  final Function(LonLat lonLat) onTap;

  @visibleForTesting
  const Map({super.key, required this.onTap});

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

class ResDialog extends StatefulWidget {
  final LonLat tappedPoint;
  final PointDetails pointDetails;

  @visibleForTesting
  const ResDialog(
      {super.key, required this.tappedPoint, required this.pointDetails});

  @override
  State<ResDialog> createState() => _ResDialogState();
}

class _ResDialogState extends State<ResDialog> {
  late final _items = widget.pointDetails
      .coordinateSystemsOrderedByDistance(reference: widget.tappedPoint);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: PointerInterceptor(
        child: _items.isEmpty
            ? const Text('No results')
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const DefaultTextStyle(
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        child: _Tile(
                          cell1: Text('coordinate system'),
                          cell2: Text('latitude, longitude (WGS84)'),
                          cell3: Text('distance from approximation'),
                        ),
                      ),
                      const Divider(),
                      ..._items.topCandidates.map(
                        (e) => _ResTile(data: e),
                      ),
                      if (_items.more.isNotEmpty)
                        ExpansionTile(
                          title: const Align(
                            alignment: Alignment.centerRight,
                            child: Text('More'),
                          ),
                          children: _items.more
                              .map((e) => _ResTile(data: e))
                              .toList(),
                        ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

typedef CoordinateSystemRes = ({
  CoordinateSystem coordinateSystem,
  double dKm,
  LonLat lonLat,
});

extension on PointDetails {
  List<CoordinateSystemRes> coordinateSystemsOrderedByDistance({
    required LonLat reference,
  }) {
    return lonLats.entries.map((e) {
      final d = distanceBetween(lonLat1: e.value, lonLat2: reference);
      final dRoundedKm = double.parse((d * 0.001).toStringAsFixed(0));
      return (
        coordinateSystem: e.key,
        dKm: dRoundedKm,
        lonLat: e.value,
      );
    }).sorted((a, b) => [
          a.dKm.compareTo(b.dKm),
          a.coordinateSystem.bounds.area
              .compareTo(b.coordinateSystem.bounds.area)
        ].firstWhere((e) => e != 0, orElse: () => 0));
  }
}

extension on List<CoordinateSystemRes> {
  List<CoordinateSystemRes> get topCandidates {
    final minD = map((e) => e.dKm).min;
    const allowance = 10;
    return takeWhile((e) => e.dKm <= minD + allowance).take(10).toList();
  }

  List<CoordinateSystemRes> get more {
    final top = topCandidates;
    return skipWhile((e) => top.contains(e)).take(150).toList();
  }
}

class _ResTile extends StatelessWidget {
  final CoordinateSystemRes data;

  const _ResTile({required this.data});

  @override
  Widget build(BuildContext context) {
    return _Tile(
      cell1: TextButton(
        onPressed: () => context
            .openUrl('https://epsg.io/${data.coordinateSystem.epsgCode}'),
        child: Text(
          data.coordinateSystem.name,
        ),
      ),
      cell2: TextButton(
        onPressed: () => context.openUrl(
            'https://maps.google.com/?q=${data.lonLat.lat},${data.lonLat.lon}'),
        child: Text(
            '${data.lonLat.lat.toStringAsFixed(3)}, ${data.lonLat.lon.toStringAsFixed(3)}'),
      ),
      cell3: Text('${data.dKm.toStringAsFixed(0)} km'),
    );
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
