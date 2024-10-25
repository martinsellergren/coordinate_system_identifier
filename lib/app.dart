import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home_page/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
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
}
