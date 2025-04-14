import 'package:coordinate_systems/coordinate_systems.dart';
import 'package:shared/geoutils/geoutils.dart';
import 'package:shared/geoutils/model.dart';

bool isLikelyWgs84DegreesInDecimalFormat(
    {required Point point, required LonLat approximation}) {
  final lonLat = LonLat(lon: point.x, lat: point.y);
  final d = distanceBetween(lonLat1: lonLat, lonLat2: approximation);
  return d <= 2500;
}
