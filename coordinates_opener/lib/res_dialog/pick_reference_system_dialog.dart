import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:shared/coordinate_system_data/model.dart';
import 'package:shared/geoutils/evaluate_coordinate_systems.dart';
import 'package:shared/geoutils/formatting.dart';
import 'package:shared/geoutils/model.dart';

class PickReferenceSystemDialog extends StatefulWidget {
  final PointDetails pointDetails;
  final LonLat tappedPoint;
  final Function(CoordinateSystem pickedCoordinateSystem) onPicked;

  const PickReferenceSystemDialog(
      {super.key,
      required this.pointDetails,
      required this.tappedPoint,
      required this.onPicked});

  @override
  State<PickReferenceSystemDialog> createState() =>
      _PickReferenceSystemDialogState();
}

class _PickReferenceSystemDialogState extends State<PickReferenceSystemDialog> {
  late final _items = widget.pointDetails
      .coordinateSystemsOrderedByDistance(reference: widget.tappedPoint);

  @override
  Widget build(BuildContext context) {
    const headerStyle = TextStyle(fontWeight: FontWeight.bold);
    return Dialog(
      child: PointerInterceptor(
        child: Padding(
          padding: const EdgeInsets.all(16).copyWith(bottom: 0),
          child: Column(
            children: [
              const _Tile(
                onTap: null,
                cell1: Text('coordinate system', style: headerStyle),
                cell2: Text('WGS84 coordinates', style: headerStyle),
                cell3: Text('distance from approximation', style: headerStyle),
              ),
              const Divider(height: 1),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 16),
                  children: _items
                      .take(100)
                      .map(
                        (e) => _Tile(
                          cell1: Text(e.coordinateSystem.name),
                          cell2: Text(e.lonLat.formatAsDegrees),
                          cell3: Text('${e.dKm} km'),
                          onTap: () => widget.onPicked(e.coordinateSystem),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final Function()? onTap;
  final Widget cell1;
  final Widget cell2;
  final Widget cell3;

  const _Tile(
      {required this.cell1,
      required this.cell2,
      required this.cell3,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: onTap,
      title: Row(
        children: [
          Expanded(flex: 5, child: Center(child: cell1)),
          Expanded(flex: 5, child: Center(child: cell2)),
          Expanded(flex: 5, child: Center(child: cell3)),
        ],
      ),
    );
  }
}
