import 'package:stacionar_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:stacionar_app/constants/sizes.dart';

class JOutlinedButtonTheme {
  JOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const StadiumBorder(),
      foregroundColor: jSecondaryLightColor,
      side: const BorderSide(color: jSecondaryLightColor),
      padding: const EdgeInsets.symmetric(vertical: jButtonHeight),
    ),
  );
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const StadiumBorder(),
      foregroundColor: jSecondaryDarkColor,
      side: const BorderSide(color: jSecondaryDarkColor),
      padding: const EdgeInsets.symmetric(vertical: jButtonHeight),
    ),
  );
}
