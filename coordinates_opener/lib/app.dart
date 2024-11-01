import 'package:coordinate_systems_data/data_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home_page/home_page.dart';

const appName = 'Coordinates opener';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      home: const HomePage(),
      builder: (context, child) =>
          Overlay.wrap(child: SelectionArea(child: child!)),
    );
  }
}

extension AppContext on BuildContext {
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
