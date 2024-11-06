import 'package:flutter/material.dart';

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
