import 'package:coordinate_systems_data/data_model.dart';

final coordinateSystemsDataSeed = CoordinateSystemsData(items: [sweref99]);

const sweref99 = CoordinateSystem(
  epsgCode: 3006,
  name: 'SWEREF99 TM',
  proj4:
      '+proj=utm +zone=33 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs +type=crs',
  bounds: Bounds(
    northEast: LonLat(lon: 10.03, lat: 54.96),
    southWest: LonLat(lon: 24.17, lat: 69.07),
  ),
);

final wgs84 = CoordinateSystem(
  epsgCode: 4326,
  name: 'WGS 84',
  proj4: '+proj=longlat +datum=WGS84 +no_defs +type=crs',
  bounds: Bounds(
    northEast: LonLat(lon: 90, lat: 180),
    southWest: LonLat(lon: -90, lat: -180),
  ),
);
