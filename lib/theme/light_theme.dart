import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
    ),
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: const Color.fromRGBO(244, 233, 215, 1),
      primary: Colors.green,
      secondary: Colors.greenAccent,
      inversePrimary: Colors.grey[900]!,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black87),
      bodyMedium: TextStyle(color: Colors.black54),
      bodySmall: TextStyle(color: Colors.black38),
    ));
