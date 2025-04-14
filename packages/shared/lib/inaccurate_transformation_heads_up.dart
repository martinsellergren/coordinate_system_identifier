import 'package:coordinate_systems/coordinate_systems.dart';
import 'package:flutter/material.dart';

import 'context_extension.dart';
import 'geoutils/model.dart';

class InaccurateTransformationHeadsUp extends StatelessWidget {
  final CoordinateSystem coordinateSystem;
  final Point inputPoint;
  final bool showLeadingAsterisk;
  final TextStyle textStyle;

  const InaccurateTransformationHeadsUp(
      {super.key,
      required this.coordinateSystem,
      required this.inputPoint,
      required this.showLeadingAsterisk,
      required this.textStyle});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Text.rich(
      TextSpan(
        style: textStyle,
        children: [
          TextSpan(
            text: [
              if (showLeadingAsterisk) "*",
              "The result may be slightly inaccurate because we don't support transformations with meter-level accuracy for this coordinate system. For more precise coordinates, go ",
            ].join(),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: InkWell(
              onTap: () => context.openUrl(
                'https://epsg.io/transform#s_srs=${coordinateSystem.epsgCode}&t_srs=4326&x=${inputPoint.x}&y=${inputPoint.y}',
              ),
              child: Text(
                'here.',
                style: textStyle.copyWith(color: primaryColor),
              ),
            ),
          ),
          // const TextSpan(
          //   text:
          //       ' We recommend that you copy the output coordinates and paste them into Google manually as latitude,longitude.',
          // ),
        ],
      ),
    );
  }
}
