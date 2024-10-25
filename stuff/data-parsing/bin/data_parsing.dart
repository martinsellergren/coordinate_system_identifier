import 'dart:convert';
import 'dart:io';

import 'package:coordinate_systems_data/data_model.dart';
import 'package:http/http.dart';
import 'package:postgres/postgres.dart' as p;

import 'model.dart';

void main(List<String> arguments) async {
  final client = Client();
  final conn = await p.Connection.open(
    p.Endpoint(
      host: '127.0.0.1',
      database: 'coordinate_systems',
      username: 'martin',
      port: 5432,
    ),
    settings: p.ConnectionSettings(sslMode: p.SslMode.disable),
  );
  final List<CoordinateSystem> items = [];
  for (int i = 0; true; i++) {
    // if (i > 5) break;
    print('Processing $i');
    final res = await conn.execute(_query(offset: i));
    if (res.isEmpty) break;
    final epsgCode = res.first[0] as int;
    final name = res.first[1] as String;
    try {
      final proj4 = await _getProj4(client: client, epsgCode: epsgCode);
      final bounds =
          await _getCoordinateSystemBounds(client: client, epsgCode: epsgCode);
      items.add(CoordinateSystem(
        epsgCode: epsgCode,
        name: name,
        proj4: proj4,
        bounds: bounds,
      ));
      await _saveJson(CoordinateSystemsData(items: items));
    } catch (e) {
      print('Error for $i: $e');
    }
  }
  await conn.close();
  client.close();
  print('Done!');
}

String _query({required int offset}) => '''
select
  coord_ref_sys_code,
  coord_ref_sys_name
from
  epsg_coordinatereferencesystem
where
  deprecated = 0
order by coord_ref_sys_code
limit 1
offset $offset
''';

Future<String> _getProj4({
  required Client client,
  required int epsgCode,
}) async {
  final res = await client.get(Uri.parse('https://epsg.io/$epsgCode.proj4'));
  if (res.statusCode != 200) throw HttpException('${res.statusCode}');
  return res.body;
}

Future<Bounds> _getCoordinateSystemBounds({
  required Client client,
  required int epsgCode,
}) async {
  final res = await client.get(Uri.parse('https://epsg.io/$epsgCode.json'));
  if (res.statusCode != 200) throw HttpException('${res.statusCode}');
  final parsed = EpsgJsonResponse.fromJson(jsonDecode(res.body));
  final bbox = parsed.bbox;
  return Bounds(
    northEast: LonLat(lon: bbox.eastLongitude, lat: bbox.northLatitude),
    southWest: LonLat(lon: bbox.westLongitude, lat: bbox.southLatitude),
  );
}

Future<void> _saveJson(CoordinateSystemsData data) async {
  await File('../../assets/coordinate_systems.json')
      .writeAsString(jsonEncode(data.toJson()));
}
