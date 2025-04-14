import 'package:coordinate_systems/coordinate_systems.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as t;

double distanceBetween({required LonLat lonLat1, required LonLat lonLat2}) {
  return t.SphericalUtil.computeDistanceBetween(
          lonLat1.asMapsToolkit, lonLat2.asMapsToolkit)
      .toDouble();
}

extension on LonLat {
  t.LatLng get asMapsToolkit => t.LatLng(lat, lon);
}

extension BoundsX on Bounds {
  bool contains(LonLat lonLat) {
    return lonLat.lon > southWest.lon &&
        lonLat.lat > southWest.lat &&
        lonLat.lon < northEast.lon &&
        lonLat.lat < northEast.lat;
  }

  double get diagonalLength {
    return distanceBetween(lonLat1: northEast, lonLat2: southWest);
  }
}
