import 'package:collection/collection.dart';
import 'package:coordinate_systems_data/data_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:separate/separate.dart';
import 'package:shared/copy_dialog.dart';
import 'package:shared/geoutils/formatting.dart';
import 'package:shared/geoutils/geoutils.dart';
import 'package:shared/geoutils/model.dart';

import '../app.dart';
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
    return Dialog(
      child: PointerInterceptor(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _Coordinates(lonLat: _activeCoordinateSystem.lonLat),
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

  const _Coordinates({required this.lonLat});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: lonLat.formatAsDegrees,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
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

class _MapWithMarker extends StatelessWidget {
  final LonLat lonLat;

  const _MapWithMarker({required this.lonLat});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: AspectRatio(
        aspectRatio: 1.5,
        child: GoogleMap(
          initialCameraPosition: const CameraPosition(target: LatLng(0, 0)),
          markers: {
            Marker(
              markerId: const MarkerId('theOneAndOnlyMarker'),
              position: LatLng(lonLat.lat, lonLat.lon),
              onTap: () => context.openInGoogleMaps(lonLat: lonLat),
            )
          },
        ),
      ),
    );
  }
}
