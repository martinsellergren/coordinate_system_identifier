import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'coordinate_system_data/model.dart';

extension ContextX on BuildContext {
  void showSnackBar(SnackBar snackBar) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  void openUrl(String url) async {
    try {
      final res = await launchUrl(Uri.parse(url));
      if (!res) throw 'unknown error';
    } catch (e) {
      if (!mounted) return;
      showSnackBar(SnackBar(content: Text('Error opening url $url ($e)')));
    }
  }

  void openInGoogleMaps({required LonLat lonLat}) =>
      openUrl('https://maps.google.com/?q=${lonLat.lat},${lonLat.lon}');
}
