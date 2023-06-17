import 'package:stacionar_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:stacionar_app/constants/sizes.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const StadiumBorder(),
      foregroundColor: jSecondaryColor,
      side: const BorderSide(color: jSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: jButtonHeight),
    ),
  );
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const StadiumBorder(),
      foregroundColor: jWhiteColor,
      side: const BorderSide(color: jWhiteColor),
      padding: const EdgeInsets.symmetric(vertical: jButtonHeight),
    ),
  );
}
