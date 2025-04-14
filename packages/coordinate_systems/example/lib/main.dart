import 'package:coordinate_systems/coordinate_systems.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _lon = 60.0;
const _lat = 60.0;
const _coordinateSystemEpsgCode = 3006; // SWEREF99 TM

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final converter = await CoordinatesConverter.create();
  runApp(MaterialApp(home: _Page()));
}

class _Page extends StatefulWidget {
  const _Page();

  @override
  State<_Page> createState() => _PageState();
}

class _PageState extends State<_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('coordinate_systems example')),
      body: Center(
        child:
            _res == null
                ? _Button(lat: _lat, lon: _lon, onPressed: () {})
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
