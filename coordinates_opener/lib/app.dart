import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared/my_google_map.dart';
import 'package:shared/theme.dart';

import 'home_page/home_page.dart';

const appName = 'Coordinates opener';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    applyGoogleMapAndroidFix();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      home: const HomePage(),
      theme: lightTheme(),
      builder: (context, child) =>
          Overlay.wrap(child: kIsWeb ? SelectionArea(child: child!) : child!),
    );
  }
}
