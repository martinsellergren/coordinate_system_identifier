import 'package:coordinate_systems/coordinate_systems.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'geoutils/formatting.dart';

const copyDialogCopyIconSize = 15.0;

class CopyDialog extends StatelessWidget {
  final LonLat lonLat;

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
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context)
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
                child: Icon(Icons.copy, size: copyDialogCopyIconSize),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
