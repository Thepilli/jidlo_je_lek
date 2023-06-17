import 'package:stacionar_app/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:stacionar_app/utils/theme/widget_themes/list_tile_theme.dart';
import 'package:stacionar_app/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:stacionar_app/utils/theme/widget_themes/text_theme.dart';
import 'package:stacionar_app/utils/theme/widget_themes/text_field_theme.dart';
import 'package:flutter/material.dart';

class JAppTheme {
  JAppTheme._();

  static ThemeData lightTheme = ThemeData(
    // scaffoldBackgroundColor: tPrimaryColor,
    brightness: Brightness.light,
    textTheme: JTextTheme.lightTextTheme,
    elevatedButtonTheme: JElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: JOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: JTextFormFieldTheme.lightInputDecorationTheme,
    listTileTheme: JListTileTheme.lightListTileTheme,
    appBarTheme: const AppBarTheme(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
  );
  static ThemeData darkTheme = ThemeData(
    // scaffoldBackgroundColor: tSecondaryColor,
    brightness: Brightness.dark,
    textTheme: JTextTheme.darkTextTheme,
    elevatedButtonTheme: JElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: JOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: JTextFormFieldTheme.darkInputDecorationTheme,
    listTileTheme: JListTileTheme.darkListTileTheme,
    appBarTheme: const AppBarTheme(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
  );
}
