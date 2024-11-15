import 'package:flutter/material.dart';

ThemeData lightTheme() {
  final theme = ThemeData.light();
  return theme.copyWith(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: ThemeData.light().appBarTheme.copyWith(
          backgroundColor: Colors.white,
        ),
    dialogTheme: theme.dialogTheme.copyWith(
      backgroundColor: Colors.white,
    ),
  );
}
