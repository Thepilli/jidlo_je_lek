import 'package:flutter/material.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;

  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: tan,
      textTheme: textTheme,
      primaryColor: Colors.greenAccent,
      primarySwatch: const MaterialColor(0xFF1CDE8F, <int, Color>{
        50: brightGreen,
        100: brightGreen,
        200: brightGreen,
        300: brightGreen,
        400: brightGreen,
        500: brightGreen,
        600: brightGreen,
        700: brightGreen,
        800: brightGreen,
        900: brightGreen,
      }),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
        scaffoldBackgroundColor: brown,
        textTheme: textTheme,
        primaryColor: Colors.greenAccent,
        primarySwatch: Colors.green);
  }

  static Color lightText = const Color.fromARGB(255, 212, 212, 212);
  static Color darkText = const Color.fromARGB(255, 26, 26, 26);
  static const Color brightGreen = Color(0xFF1CDE8F);
  static const Color brightGreenAccent = Color(0xFFA0E5C9);
  static const Color lime = Color(0xFFD3EC54);
  static const Color limeAccent = Color(0xFFD8E2AA);
  static const Color gold = Color(0xFFFCC824);
  static const Color orange = Color(0xFFFF9628);
  static const Color red = Color(0xFFFF5917);
  static const Color tan = Color(0xFFF4E9D7);
  static const Color brown = Color.fromARGB(255, 26, 26, 26);
  static const Color white = Color(0xFFFFFFFF);

  static const String fontName = 'WorkSans';

  static TextTheme textTheme = TextTheme(
    headlineMedium: h2,
    headlineSmall: h4,
    titleLarge: title,
    titleSmall: subtitle,
    bodyMedium: body2,
    bodyLarge: body1,
    bodySmall: caption,
  );

  static TextStyle h2 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: _isDarkTheme ? lightText : darkText,
  );

  static TextStyle h4 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: _isDarkTheme ? lightText : darkText,
  );

  static TextStyle title = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: _isDarkTheme ? lightText : darkText,
  );

  static TextStyle subtitle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: _isDarkTheme ? lightText : darkText,
  );

  static TextStyle body2 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: _isDarkTheme ? lightText : darkText,
  );

  static TextStyle body1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: _isDarkTheme ? lightText : darkText,
  );

  static TextStyle caption = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 15,
    letterSpacing: 0.2,
    color: _isDarkTheme ? lightText : darkText, // was lightText
  );
}
