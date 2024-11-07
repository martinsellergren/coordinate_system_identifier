import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:shared/context_extension.dart';
import 'package:shared/coordinate_system_data/model.dart';
import 'package:shared/copy_dialog.dart';
import 'package:shared/geoutils/evaluate_coordinate_systems.dart';
import 'package:shared/geoutils/formatting.dart';
import 'package:shared/geoutils/model.dart';
import 'package:shared/inaccurate_transformation_heads_up.dart';

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
                          cell1: Text(
                            'coordinate system',
                            textAlign: TextAlign.center,
                          ),
                          cell2: Text(
                            'WGS84 coordinates',
                            textAlign: TextAlign.center,
                          ),
                          cell3: Text(
                            'distance from approximation',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const Divider(),
                      ..._items.topCandidates.map(
                        (e) => _ResTile(
                          data: e,
                          inputPoint: widget.pointDetails.point,
                        ),
                      ),
                      if (_items.more.isNotEmpty)
                        ExpansionTile(
                          title: const Align(
                            alignment: Alignment.centerRight,
                            child: Text('More'),
                          ),
                          children: _items.more
                              .map((e) => _ResTile(
                                    data: e,
                                    inputPoint: widget.pointDetails.point,
                                  ))
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
  final Point inputPoint;

  const _ResTile({required this.data, required this.inputPoint});

  @override
  Widget build(BuildContext context) {
    return _Tile(
      cell1: TextButton(
        onPressed: () => context
            .openUrl('https://epsg.io/${data.coordinateSystem.epsgCode}'),
        child: Text(
          data.coordinateSystem.name,
          textAlign: TextAlign.center,
        ),
      ),
      cell2: TextButton(
        onPressed: () {
          final url =
              'https://maps.google.com/?q=${data.lonLat.lat},${data.lonLat.lon}';
          data.coordinateSystem.hasNadgrid
              ? showDialog(
                  context: context,
                  builder: (context) => _InaccurateTransformationDialog(
                    data: data,
                    inputPoint: inputPoint,
                  ),
                ).then(
                  (res) async => context.mounted ? context.openUrl(url) : null)
              : context.openUrl(url);
        },
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

class _InaccurateTransformationDialog extends StatelessWidget {
  final CoordinateSystemRes data;
  final Point inputPoint;

  const _InaccurateTransformationDialog(
      {required this.data, required this.inputPoint});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: 500,
        child: InaccurateTransformationHeadsUp(
          coordinateSystem: data.coordinateSystem,
          inputPoint: inputPoint,
          showLeadingAsterisk: false,
          textStyle: const TextStyle(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Ok'),
        ),
      ],
    );
  }
}

class _LatLong extends StatelessWidget {
  final LonLat lonLat;

  const _LatLong({required this.lonLat});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            lonLat.formatAsDegrees,
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          onPressed: () => showDialog(
            context: context,
            builder: (context) => CopyDialog(lonLat: lonLat),
          ),
          icon: const Icon(
            Icons.copy,
            size: copyDialogCopyIconSize,
          ),
        ),
      ],
    );
  }
}
