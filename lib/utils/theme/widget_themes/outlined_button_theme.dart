import 'package:stacionar_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:stacionar_app/constants/sizes.dart';

class JOutlinedButtonTheme {
  JOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const StadiumBorder(),
      foregroundColor: jPrimaryLightColorShade,
      side: const BorderSide(color: jPrimaryLightColorShade),
      padding: const EdgeInsets.symmetric(vertical: jButtonHeight),
    ),
  );
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const StadiumBorder(),
      foregroundColor: jPrimaryDarkColorShade,
      side: const BorderSide(color: jPrimaryDarkColorShade),
      padding: const EdgeInsets.symmetric(vertical: jButtonHeight),
    ),
  );
}
