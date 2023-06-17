import 'package:stacionar_app/constants/colors.dart';
import 'package:flutter/material.dart';

class JTextFormFieldTheme {
  JTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
    prefixIconColor: jSecondaryLightColor,
    floatingLabelStyle: const TextStyle(color: jSecondaryLightColor),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: jSecondaryLightColor),
    ),
  );
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
    prefixIconColor: jSecondaryDarkColor,
    floatingLabelStyle: const TextStyle(color: jSecondaryDarkColor),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: jSecondaryDarkColor),
    ),
  );
}
