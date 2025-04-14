import 'package:collection/collection.dart';
import 'package:coordinate_systems_model/coordinate_systems_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart' as l;
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:separate/separate.dart';
import 'package:shared/context_extension.dart';
import 'package:shared/copy_dialog.dart';
import 'package:shared/geoutils/formatting.dart';
import 'package:shared/geoutils/geoutils.dart';
import 'package:shared/geoutils/model.dart';
import 'package:shared/inaccurate_transformation_heads_up.dart';
import 'package:shared/my_google_map.dart';

import 'pick_reference_system_dialog.dart';

class AmbiguousResDialog extends StatefulWidget {
  final PointDetails inputPointDetails;
  final LonLat tappedPoint;
  final bool showDummyLoadingScreen;

  const AmbiguousResDialog({
    super.key,
    required this.inputPointDetails,
    required this.tappedPoint,
    this.showDummyLoadingScreen = true,
  });

  @override
  State<AmbiguousResDialog> createState() => _AmbiguousResDialogState();
}

class _AmbiguousResDialogState extends State<AmbiguousResDialog> {
  late bool _showLoadingScreen = widget.showDummyLoadingScreen;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 400,
        child: PointerInterceptor(
          child: Stack(
            children: [
              _Content(
                inputPointDetails: widget.inputPointDetails,
                tappedPoint: widget.tappedPoint,
              ),
              if (_showLoadingScreen)
                Positioned.fill(
                  child: _LoadingScreen(
                    onComplete:
                        () => setState(() => _showLoadingScreen = false),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoadingScreen extends StatefulWidget {
  final Function onComplete;

  const _LoadingScreen({required this.onComplete});

  @override
  State<_LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<_LoadingScreen>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(vsync: this);

  @override
  void initState() {
    super.initState();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onComplete();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '''Analyzing your input to find the best matching coordinate system...''',
                textAlign: TextAlign.center,
              ),
              SizedBox.square(
                dimension: 300,
                child: l.Lottie.asset(
                  'packages/coordinates_opener/assets/loading_animation.json',
                  controller: _controller,
                  onLoaded:
                      (data) =>
                          _controller
                            ..duration = data.duration
                            ..forward(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Content extends StatefulWidget {
  final PointDetails inputPointDetails;
  final LonLat tappedPoint;

  const _Content({required this.inputPointDetails, required this.tappedPoint});

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  late var _activeCoordinateSystem = _pickBestMatch(
    pointDetails: widget.inputPointDetails,
    approximation: widget.tappedPoint,
  );

  @override
  Widget build(BuildContext context) {
    final bool isInaccurate =
        _activeCoordinateSystem.coordinateSystem.hasNadgrid;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _Coordinates(
            lonLat: _activeCoordinateSystem.lonLat,
            isInaccurate: isInaccurate,
          ),
          _CoordinateSystem(
            coordinateSystem: _activeCoordinateSystem.coordinateSystem,
          ),
          _MapWithMarker(lonLat: _activeCoordinateSystem.lonLat),
          _ChangeCoordinateSystem(
            inputPointDetails: widget.inputPointDetails,
            tappedPoint: widget.tappedPoint,
            onPickCoordinateSystem:
                (pickedCoordinateSystem) => setState(
                  () =>
                      _activeCoordinateSystem = (
                        coordinateSystem: pickedCoordinateSystem,
                        lonLat:
                            widget
                                .inputPointDetails
                                .lonLats[pickedCoordinateSystem]!,
                      ),
                ),
          ),
          if (isInaccurate)
            _InaccurateTransformationHeadsUp(
              inputPoint: widget.inputPointDetails.point,
              coordinateSystem: _activeCoordinateSystem.coordinateSystem,
            ),
        ].separate((i, e0, e1) => const SizedBox(height: 16)),
      ),
    );
  }
}

({CoordinateSystem coordinateSystem, LonLat lonLat}) _pickBestMatch({
  required PointDetails pointDetails,
  required LonLat approximation,
}) {
  final res =
      pointDetails.lonLats.entries
          .map((e) {
            final d = distanceBetween(lonLat1: e.value, lonLat2: approximation);
            final dRoundedKm = double.parse((d * 0.001).toStringAsFixed(0));
            return (sys: e.key, p: e.value, d: dRoundedKm);
          })
          .sorted(
            (a, b) => [
              a.d.compareTo(b.d),
              a.sys.name.compareTo(b.sys.name),
            ].firstWhere((e) => e != 0, orElse: () => 0),
          )
          .first;
  return (coordinateSystem: res.sys, lonLat: res.p);
}

class _Coordinates extends StatelessWidget {
  final LonLat lonLat;
  final bool isInaccurate;

  const _Coordinates({required this.lonLat, required this.isInaccurate});

  @override
  Widget build(BuildContext context) {
    final copyButton = IconButton(
      onPressed:
          () => showDialog(
            context: context,
            builder: (context) => CopyDialog(lonLat: lonLat),
          ),
      icon: const Icon(Icons.copy, size: copyDialogCopyIconSize),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('click to open in Google Maps:'),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Opacity(opacity: 0, child: IgnorePointer(child: copyButton)),
            Flexible(
              child: TextButton(
                onPressed: () => context.openInGoogleMaps(lonLat: lonLat),
                child: Text(
                  [lonLat.formatAsDegrees, if (isInaccurate) ' *'].join(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            copyButton,
          ],
        ),
      ],
    );
  }
}

class _CoordinateSystem extends StatelessWidget {
  final CoordinateSystem coordinateSystem;

  const _CoordinateSystem({required this.coordinateSystem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('coordinate system:'),
        TextButton(
          style: TextButton.styleFrom(visualDensity: VisualDensity.compact),
          onPressed:
              () => context.openUrl(
                'https://epsg.io/${coordinateSystem.epsgCode}',
              ),
          child: Text(coordinateSystem.name),
        ),
      ],
    );
  }
}

const _footerTextSize = 12.0;

class _ChangeCoordinateSystem extends StatelessWidget {
  final PointDetails inputPointDetails;
  final LonLat tappedPoint;
  final Function(CoordinateSystem pickedCoordinateSystem)
  onPickCoordinateSystem;

  const _ChangeCoordinateSystem({
    required this.inputPointDetails,
    required this.tappedPoint,
    required this.onPickCoordinateSystem,
  });

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: _footerTextSize);
    final primaryColor = Theme.of(context).primaryColor;
    return Text.rich(
      style: style,
      TextSpan(
        children: [
          const TextSpan(
            text:
                '''If the result isn't what you expect the point might be defined in different coordinate system. ''',
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: InkWell(
              onTap:
                  () => showDialog(
                    context: context,
                    builder:
                        (context) => PickReferenceSystemDialog(
                          pointDetails: inputPointDetails,
                          tappedPoint: tappedPoint,
                          onPicked: (pickedCoordinateSystem) {
                            Navigator.of(context).pop();
                            onPickCoordinateSystem(pickedCoordinateSystem);
                          },
                        ),
                  ),
              child: Text(
                'Click here',
                style: style.copyWith(color: primaryColor),
              ),
            ),
          ),
          const TextSpan(text: ' to try another one.'),
        ],
      ),
    );
  }
}

class _MapWithMarker extends StatelessWidget {
  final LonLat lonLat;

  const _MapWithMarker({required this.lonLat});

  @override
  Widget build(BuildContext context) {
    return MyGoogleMap(
      cameraTarget: lonLat,
      zoom: 1,
      markers: {
        Marker(
          markerId: const MarkerId('theOneAndOnlyMarker'),
          position: lonLat.toGoogle(),
          onTap: () => context.openInGoogleMaps(lonLat: lonLat),
        ),
      },
    );
  }
}

extension on LonLat {
  LatLng toGoogle() => LatLng(lat, lon);
}

class _InaccurateTransformationHeadsUp extends StatelessWidget {
  final Point inputPoint;
  final CoordinateSystem coordinateSystem;

  const _InaccurateTransformationHeadsUp({
    required this.inputPoint,
    required this.coordinateSystem,
  });

  @override
  Widget build(BuildContext context) {
    return InaccurateTransformationHeadsUp(
      coordinateSystem: coordinateSystem,
      inputPoint: inputPoint,
      showLeadingAsterisk: true,
      textStyle: const TextStyle(fontSize: _footerTextSize),
    );
  }
}
