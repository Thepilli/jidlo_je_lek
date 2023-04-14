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
      primaryColor: lime,
      primarySwatch: MaterialColor(0xFFD3EC54, <int, Color>{
        50: lime,
        100: lime,
        200: lime,
        300: lime,
        400: lime,
        500: lime,
        600: lime,
        700: lime,
        800: lime,
        900: lime,
      }),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: brown,
      textTheme: textTheme,
      primaryColor: brightGreen,
      primarySwatch: MaterialColor(0xFF1ADE8E, <int, Color>{
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

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color.fromARGB(255, 222, 23, 60);
  static const Color lightText = Color(0xFF4A6572);
  static const Color brightGreen = Color(0xFF1CDE8F);
  static const Color lime = Color(0xFFD3EC54);
  static const Color gold = Color(0xFFFCC824);
  static const Color orange = Color(0xFFFF9628);
  static const Color red = Color(0xFFFF5917);
  static const Color tan = Color(0xFFF4E9D7);
  static const Color brown = Color(0xFF3D3930);
  static const String fontName = 'WorkSans';

  static const TextTheme textTheme = TextTheme(
    headlineMedium: display1,
    headlineSmall: headline,
    titleLarge: title,
    titleSmall: subtitle,
    bodyMedium: body2,
    bodyLarge: body1,
    bodySmall: caption,
  );

  static const TextStyle display1 = TextStyle(
    // h4 -> display1
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    //color: darkerText,
  );

  static const TextStyle headline = TextStyle(
    // h5 -> headline
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    //color: darkerText,
  );

  static const TextStyle title = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    //color: darkerText,
  );

  static const TextStyle subtitle = TextStyle(
    // subtitle2 -> subtitle
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    //color: darkText,
  );

  static const TextStyle body2 = TextStyle(
    // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    //color: darkText,
  );

  static const TextStyle body1 = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    //color: darkText,
  );

  static const TextStyle caption = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    //color: lightText, // was lightText
  );
}
