import 'dart:convert';
import 'dart:io';

import 'package:coordinate_systems/coordinate_systems.dart';
import 'package:http/http.dart';
import 'package:postgres/postgres.dart' as p;

import 'epsg_response_model.dart';

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
      final epsgJson = await _getEpsgJson(client: client, epsgCode: epsgCode);
      items.add(CoordinateSystem(
        epsgCode: epsgCode,
        name: name,
        proj4: proj4,
        bounds: epsgJson.bounds,
      ));
      await _saveJson(CoordinateSystemsData(items: items));
    } catch (e, s) {
      print('Error for $epsgCode: $e $s');
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
  and coord_ref_sys_kind = 'projected'
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

Future<EpsgJsonResponse> _getEpsgJson({
  required Client client,
  required int epsgCode,
}) async {
  final res = await client.get(Uri.parse('https://epsg.io/$epsgCode.json'));
  if (res.statusCode != 200) throw HttpException('${res.statusCode}');
  return EpsgJsonResponse.fromJson(jsonDecode(res.body));
}

Future<void> _saveJson(CoordinateSystemsData data) async {
  await File('../packages/coordinate_systems/assets/coordinate_systems.json')
      .writeAsString(jsonEncode(data.toJson()));
}

extension on EpsgJsonResponse {
  Bounds get bounds => Bounds(
        northEast: LonLat(lon: bbox.eastLongitude, lat: bbox.northLatitude),
        southWest: LonLat(lon: bbox.westLongitude, lat: bbox.southLatitude),
      );
}
