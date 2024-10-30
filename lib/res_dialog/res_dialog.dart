import 'package:collection/collection.dart';
import 'package:coordinate_systems_data/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latlong_formatter/latlong_formatter.dart' as f;
import 'package:pointer_interceptor/pointer_interceptor.dart';

import '../app.dart';
import '../geoutils/geoutils.dart';
import '../geoutils/model.dart';

class ResDialog extends StatefulWidget {
  final LonLat tappedPoint;
  final PointDetails pointDetails;

  const ResDialog(
      {super.key, required this.tappedPoint, required this.pointDetails});

  @override
  State<ResDialog> createState() => _ResDialogState();
}

class _ResDialogState extends State<ResDialog> {
  late final _items = widget.pointDetails
      .coordinateSystemsOrderedByDistance(reference: widget.tappedPoint);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: PointerInterceptor(
        child: _items.isEmpty
            ? const Text('No results')
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const DefaultTextStyle(
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        child: _Tile(
                          cell1: Text('coordinate system'),
                          cell2: Text('WGS84 coordinates'),
                          cell3: Text('distance from approximation'),
                        ),
                      ),
                      const Divider(),
                      ..._items.topCandidates.map(
                        (e) => _ResTile(data: e),
                      ),
                      if (_items.more.isNotEmpty)
                        ExpansionTile(
                          title: const Align(
                            alignment: Alignment.centerRight,
                            child: Text('More'),
                          ),
                          children: _items.more
                              .map((e) => _ResTile(data: e))
                              .toList(),
                        ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

typedef CoordinateSystemRes = ({
  CoordinateSystem coordinateSystem,
  double dKm,
  LonLat lonLat,
});

extension on PointDetails {
  List<CoordinateSystemRes> coordinateSystemsOrderedByDistance({
    required LonLat reference,
  }) {
    return lonLats.entries.map((e) {
      final d = distanceBetween(lonLat1: e.value, lonLat2: reference);
      final dRoundedKm = double.parse((d * 0.001).toStringAsFixed(0));
      return (
        coordinateSystem: e.key,
        dKm: dRoundedKm,
        lonLat: e.value,
      );
    }).sorted((a, b) => [
          a.dKm.compareTo(b.dKm),
          // a.coordinateSystem.bounds.diagonalLength
          //     .compareTo(b.coordinateSystem.bounds.diagonalLength),
          a.coordinateSystem.name.compareTo(b.coordinateSystem.name)
        ].firstWhere((e) => e != 0, orElse: () => 0));
  }
}

extension on List<CoordinateSystemRes> {
  List<CoordinateSystemRes> get topCandidates {
    final minD = map((e) => e.dKm).min;
    const allowance = 10;
    return takeWhile((e) => e.dKm <= minD + allowance).take(10).toList();
  }

  List<CoordinateSystemRes> get more {
    final top = topCandidates;
    return skipWhile((e) => top.contains(e)).take(150).toList();
  }
}

class _ResTile extends StatelessWidget {
  final CoordinateSystemRes data;

  const _ResTile({required this.data});

  @override
  Widget build(BuildContext context) {
    return _Tile(
      cell1: TextButton(
        onPressed: () => context
            .openUrl('https://epsg.io/${data.coordinateSystem.epsgCode}'),
        child: Text(
          data.coordinateSystem.name,
        ),
      ),
      cell2: TextButton(
        onPressed: () => context.openUrl(
            'https://maps.google.com/?q=${data.lonLat.lat},${data.lonLat.lon}'),
        child: _LatLong(lonLat: data.lonLat),
      ),
      cell3: Text('${data.dKm.toStringAsFixed(0)} km'),
    );
  }
}

class _Tile extends StatelessWidget {
  final Widget cell1;
  final Widget cell2;
  final Widget cell3;

  const _Tile({required this.cell1, required this.cell2, required this.cell3});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 5, child: Center(child: cell1)),
        Expanded(flex: 5, child: Center(child: cell2)),
        Expanded(flex: 3, child: Center(child: cell3)),
      ],
    );
  }
}

class _LatLong extends StatelessWidget {
  final LonLat lonLat;

  const _LatLong({required this.lonLat});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: lonLat.formatAsDegrees,
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
                size: _copyIconSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension on LonLat {
  String get formatAsDegrees =>
      f.LatLongFormatter('''{latd°m's.s"c} {lond°m's.s"c}''')
          .format(f.LatLong(lat, lon));

  String get formatAsDecimal =>
      f.LatLongFormatter('''{lat-d.ddddd}, {lon-d.ddddd}''')
          .format(f.LatLong(lat, lon));
}

const _copyIconSize = 15.0;

class CopyDialog extends StatelessWidget {
  final LonLat lonLat;

  @visibleForTesting
  const CopyDialog({super.key, required this.lonLat});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(children: [
      _CopyTile(text: lonLat.formatAsDegrees),
      _CopyTile(text: lonLat.formatAsDecimal),
    ]);
  }
}

class _CopyTile extends StatelessWidget {
  final String text;

  const _CopyTile({required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await Clipboard.setData(ClipboardData(text: text));
        if (!context.mounted) return;
        context
            .showSnackBar(const SnackBar(content: Text('Copied to clipboard')));
        Navigator.of(context).pop();
      },
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: text),
            const WidgetSpan(
              child: Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(Icons.copy, size: _copyIconSize),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
