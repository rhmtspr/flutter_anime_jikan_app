import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.red,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(centerTitle: true),
    cardTheme: CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.red,
    brightness: Brightness.dark,
  );
}
