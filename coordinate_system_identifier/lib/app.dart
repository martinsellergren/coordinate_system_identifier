import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared/theme.dart';

import 'home_page/home_page.dart';

const appName = 'Coordinate system identifier';

class App extends StatelessWidget {
  const App({super.key});

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
