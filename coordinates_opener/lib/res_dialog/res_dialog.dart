import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:separate/separate.dart';
import 'package:shared/context_extension.dart';
import 'package:shared/coordinate_system_data/model.dart';
import 'package:shared/copy_dialog.dart';
import 'package:shared/geoutils/formatting.dart';
import 'package:shared/geoutils/geoutils.dart';
import 'package:shared/geoutils/model.dart';
import 'package:shared/inaccurate_transformation_heads_up.dart';

import 'pick_reference_system_dialog.dart';

class AmbiguousResDialog extends StatefulWidget {
  final PointDetails inputPointDetails;
  final LonLat tappedPoint;

  const AmbiguousResDialog(
      {super.key, required this.inputPointDetails, required this.tappedPoint});

  @override
  State<AmbiguousResDialog> createState() => _AmbiguousResDialogState();
}

class _AmbiguousResDialogState extends State<AmbiguousResDialog> {
  late var _activeCoordinateSystem = _pickBestMatch(
    pointDetails: widget.inputPointDetails,
    approximation: widget.tappedPoint,
  );

  @override
  Widget build(BuildContext context) {
    final bool isInaccurate =
        _activeCoordinateSystem.coordinateSystem.hasNadgrid;
    return Dialog(
      child: PointerInterceptor(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _Coordinates(
                lonLat: _activeCoordinateSystem.lonLat,
                isInaccurate: isInaccurate,
              ),
              _CoordinateSystem(
                coordinateSystem: _activeCoordinateSystem.coordinateSystem,
                inputPointDetails: widget.inputPointDetails,
                tappedPoint: widget.tappedPoint,
                onPickCoordinateSystem: (pickedCoordinateSystem) =>
                    setState(() => _activeCoordinateSystem = (
                          coordinateSystem: pickedCoordinateSystem,
                          lonLat: widget.inputPointDetails
                              .lonLats[pickedCoordinateSystem]!,
                        )),
              ),
              _OpenInGoogleMapsButton(lonLat: _activeCoordinateSystem.lonLat),
              _MapWithMarker(lonLat: _activeCoordinateSystem.lonLat),
              if (isInaccurate)
                _InaccurateTransformationHeadsUp(
                  inputPoint: widget.inputPointDetails.point,
                  coordinateSystem: _activeCoordinateSystem.coordinateSystem,
                ),
            ].separate((i, e0, e1) => const SizedBox(height: 16)),
          ),
        ),
      ),
    );
  }
}

({CoordinateSystem coordinateSystem, LonLat lonLat}) _pickBestMatch(
    {required PointDetails pointDetails, required LonLat approximation}) {
  final res = pointDetails.lonLats.entries
      .map((e) {
        final d = distanceBetween(lonLat1: e.value, lonLat2: approximation);
        final dRoundedKm = double.parse((d * 0.001).toStringAsFixed(0));
        return (sys: e.key, p: e.value, d: dRoundedKm);
      })
      .sorted((a, b) => [
            a.d.compareTo(b.d),
            a.sys.name.compareTo(b.sys.name),
          ].firstWhere((e) => e != 0, orElse: () => 0))
      .first;
  return (coordinateSystem: res.sys, lonLat: res.p);
}

class _Coordinates extends StatelessWidget {
  final LonLat lonLat;
  final bool isInaccurate;

  const _Coordinates({required this.lonLat, required this.isInaccurate});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
    );
    return Text.rich(
      TextSpan(
        style: style,
        children: [
          TextSpan(
            text: lonLat.formatAsDegrees,
          ),
          if (isInaccurate) const TextSpan(text: ' *'),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: IconButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => CopyDialog(lonLat: lonLat),
              ),
              icon: const Icon(
                Icons.copy,
                size: copyDialogCopyIconSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CoordinateSystem extends StatelessWidget {
  final CoordinateSystem coordinateSystem;
  final PointDetails inputPointDetails;
  final LonLat tappedPoint;
  final Function(CoordinateSystem pickedCoordinateSystem)
      onPickCoordinateSystem;

  const _CoordinateSystem(
      {required this.coordinateSystem,
      required this.inputPointDetails,
      required this.tappedPoint,
      required this.onPickCoordinateSystem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () => context
                  .openUrl('https://epsg.io/${coordinateSystem.epsgCode}'),
              child: Text(coordinateSystem.name),
            ),
            IconButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => PickReferenceSystemDialog(
                  pointDetails: inputPointDetails,
                  tappedPoint: tappedPoint,
                  onPicked: (pickedCoordinateSystem) {
                    Navigator.of(context).pop();
                    onPickCoordinateSystem(pickedCoordinateSystem);
                  },
                ),
              ),
              icon: const Icon(Icons.edit, size: 15),
            )
          ],
        ),
      ],
    );
  }
}

class _OpenInGoogleMapsButton extends StatelessWidget {
  final LonLat lonLat;

  const _OpenInGoogleMapsButton({required this.lonLat});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.openInGoogleMaps(lonLat: lonLat),
      child: const Text(
        'Open in Google Maps',
      ),
    );
  }
}

const _mapWidth = 350.0;

class _MapWithMarker extends StatefulWidget {
  final LonLat lonLat;

  const _MapWithMarker({required this.lonLat});

  @override
  State<_MapWithMarker> createState() => _MapWithMarkerState();
}

class _MapWithMarkerState extends State<_MapWithMarker> {
  GoogleMapController? _controller;

  @override
  void didUpdateWidget(covariant _MapWithMarker oldWidget) {
    if (widget.lonLat != oldWidget.lonLat) {
      _controller?.animateCamera(
          CameraUpdate.newLatLngZoom(widget.lonLat.toGoogle(), 1));
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _mapWidth,
      child: AspectRatio(
        aspectRatio: 1.5,
        child: GoogleMap(
          onMapCreated: (controller) => _controller = controller,
          initialCameraPosition: CameraPosition(
            target: widget.lonLat.toGoogle(),
            zoom: 1,
          ),
          markers: {
            Marker(
              markerId: const MarkerId('theOneAndOnlyMarker'),
              position: widget.lonLat.toGoogle(),
              onTap: () => context.openInGoogleMaps(lonLat: widget.lonLat),
            ),
          },
        ),
      ),
    );
  }
}

extension on LonLat {
  LatLng toGoogle() => LatLng(lat, lon);
}

class _InaccurateTransformationHeadsUp extends StatelessWidget {
  final Point inputPoint;
  final CoordinateSystem coordinateSystem;

  const _InaccurateTransformationHeadsUp(
      {required this.inputPoint, required this.coordinateSystem});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _mapWidth + 50,
      child: InaccurateTransformationHeadsUp(
        coordinateSystem: coordinateSystem,
        inputPoint: inputPoint,
        showLeadingAsterisk: true,
        textStyle: const TextStyle(
          color: Colors.red,
          fontSize: 12,
        ),
      ),
    );
  }
}
