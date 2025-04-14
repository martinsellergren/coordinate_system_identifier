import 'package:coordinate_systems/coordinate_systems.dart';
import 'package:flutter/material.dart';
import 'package:proj4dart/proj4dart.dart' as p;
import 'package:url_launcher/url_launcher.dart';

const _lon = 60.0;
const _lat = 60.0;
const _coordinateSystemEpsgCode = 3006; // SWEREF99 TM

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final coordinateSystemsData = await loadCoordinateSystemData();
  await _loadAllProjProjections(coordinateSystemsData: coordinateSystemsData);
  runApp(MaterialApp(home: _Page()));
}

// Load add coordinate systems.
// Alt, load just the ones you need.
Future<void> _loadAllProjProjections({
  required CoordinateSystemsData coordinateSystemsData,
}) async {
  int nSuccess = 0;
  int nErrors = 0;
  for (final e in coordinateSystemsData.items) {
    try {
      p.Projection.add(e.epsgCode.toString(), e.proj4);
      nSuccess++;
    } catch (error) {
      print('Error registering proj4 definition for ${e.epsgCode}');
      nErrors++;
    }
  }
  print('Load projections, nSuccess: $nSuccess, nErrors: $nErrors');
}

class _Page extends StatefulWidget {
  const _Page();

  @override
  State<_Page> createState() => _PageState();
}

class _PageState extends State<_Page> {
  p.Point? _res;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('coordinate_systems example')),
      body: Center(
        child:
            _res == null
                ? _Button(
                  lat: _lat,
                  lon: _lon,
                  onPressed: () {
                    final proj = p.Projection.get('$_coordinateSystemEpsgCode');
                    assert(
                      proj != null,
                      'Make sure the proj $_coordinateSystemEpsgCode is loaded successfully',
                    );
                    setState(() {
                      _res = p.Projection.WGS84.transform(
                        proj!,
                        p.Point(x: _lon, y: _lat),
                      );
                    });
                  },
                )
                : _Res(lat: _lat, lon: _lon, res: _res!),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final double lon;
  final double lat;
  final Function() onPressed;

  const _Button({
    required this.onPressed,
    required this.lon,
    required this.lat,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        'Press to convert point (lon=$lon lat=$lat) to coordinate system epsg=$_coordinateSystemEpsgCode',
      ),
    );
  }
}

class _Res extends StatelessWidget {
  final double lon;
  final double lat;
  final p.Point res;

  const _Res({required this.res, required this.lon, required this.lat});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'The result is (x=${res.x.toStringAsFixed(2)} y=${res.y.toStringAsFixed(2)})',
        ),
        TextButton(
          child: Text('Confirm if you please'),
          onPressed:
              () => launchUrl(
                Uri.parse(
                  'https://epsg.io/transform#s_srs=4326&t_srs=3006&x=$lon&y=$lat',
                ),
              ),
        ),
      ],
    );
  }
}
