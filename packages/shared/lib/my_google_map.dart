import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

import 'coordinate_system_data/model.dart';

// this is necessary as otherwise when returning the map is blank until you scroll, on android
void applyGoogleMapAndroidFix() {
  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    mapsImplementation.useAndroidViewSurface = true;
  }
}

class MyGoogleMap extends StatefulWidget {
  final LonLat cameraTarget;
  final double zoom;
  final Function(LonLat lonLat)? onTap;
  final Set<Marker> markers;

  const MyGoogleMap(
      {super.key,
      required this.cameraTarget,
      required this.zoom,
      this.onTap,
      this.markers = const {}});

  @override
  State<MyGoogleMap> createState() => _MyGoogleMapState();
}

class _MyGoogleMapState extends State<MyGoogleMap> {
  GoogleMapController? _controller;

  @override
  void didUpdateWidget(covariant MyGoogleMap oldWidget) {
    if (widget.cameraTarget != oldWidget.cameraTarget ||
        widget.zoom != oldWidget.zoom) {
      _controller?.animateCamera(CameraUpdate.newLatLngZoom(
          widget.cameraTarget.toGoogle(), widget.zoom));
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: kIsWeb ? 2 : 1,
      child: GoogleMap(
        myLocationEnabled: false,
        myLocationButtonEnabled: false,
        compassEnabled: false,
        zoomControlsEnabled: kIsWeb,
        rotateGesturesEnabled: false,
        tiltGesturesEnabled: false,
        gestureRecognizers: {Factory(() => EagerGestureRecognizer())},
        initialCameraPosition: CameraPosition(
          target: widget.cameraTarget.toGoogle(),
          zoom: widget.zoom,
        ),
        onMapCreated: (controller) {
          _controller = controller;
          Future.delayed(
            const Duration(milliseconds: 500),
            () {
              // this shit necessary due to bug with google maps on android, where initial camera position doesn't work
              if (!mounted) return;
              controller.moveCamera(CameraUpdate.newLatLngZoom(
                widget.cameraTarget.toGoogle(),
                widget.zoom,
              ));
            },
          );
        },
        onTap: widget.onTap == null
            ? null
            : (argument) => widget.onTap!.call(LonLat(
                  lon: argument.longitude,
                  lat: argument.latitude,
                )),
        markers: widget.markers,
      ),
    );
  }
}

extension on LonLat {
  LatLng toGoogle() => LatLng(lat, lon);
}
