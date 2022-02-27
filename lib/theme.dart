import 'package:flutter/material.dart';

final THEME = ThemeData(
  colorSchemeSeed: Colors.amber,
  useMaterial3: true,
);
final Theme_Color_Scheme = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
        seedColor: Color.fromARGB(255, 245, 193, 39),
        brightness: Brightness.dark,
        primary: Color.fromARGB(255, 165, 124, 2),
        secondary: Colors.deepOrange,
        shadow: Colors.black26,
        tertiary: Color.fromARGB(255, 163, 217, 224),
        background: Color.fromARGB(96, 44, 43, 43)));
