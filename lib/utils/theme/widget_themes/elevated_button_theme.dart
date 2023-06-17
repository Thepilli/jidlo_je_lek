import 'package:stacionar_app/constants/sizes.dart';
import 'package:flutter/material.dart';

class JElevatedButtonTheme {
  JElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const StadiumBorder(),
      foregroundColor: jPrimaryLightColor,
      backgroundColor: jSecondaryLightColor,
      side: const BorderSide(color: jSecondaryLightColor),
      padding: const EdgeInsets.symmetric(vertical: jButtonHeight),
    ),
  );
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const StadiumBorder(),
      foregroundColor: jPrimaryDarkColor,
      backgroundColor: jSecondaryDarkColor,
      side: const BorderSide(color: jSecondaryDarkColor),
      padding: const EdgeInsets.symmetric(vertical: jButtonHeight),
    ),
  );
}
