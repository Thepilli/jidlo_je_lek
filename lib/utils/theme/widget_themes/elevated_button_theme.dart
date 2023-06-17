import 'package:stacionar_app/constants/colors.dart';
import 'package:stacionar_app/constants/sizes.dart';
import 'package:flutter/material.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const StadiumBorder(),
      foregroundColor: jWhiteColor,
      backgroundColor: jSecondaryColor,
      side: const BorderSide(color: jSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: jButtonHeight),
    ),
  );
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const StadiumBorder(),
      foregroundColor: jSecondaryColor,
      backgroundColor: jWhiteColor,
      side: const BorderSide(color: jWhiteColor),
      padding: const EdgeInsets.symmetric(vertical: jButtonHeight),
    ),
  );
}
