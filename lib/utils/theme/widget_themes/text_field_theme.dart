import 'package:stacionar_app/constants/colors.dart';
import 'package:flutter/material.dart';

class JTextFormFieldTheme {
  JTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
    prefixIconColor: jSecondaryColor,
    floatingLabelStyle: const TextStyle(color: jSecondaryColor),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: jSecondaryColor),
    ),
  );
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
    prefixIconColor: jPrimaryColor,
    floatingLabelStyle: const TextStyle(color: jPrimaryColor),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: jPrimaryColor),
    ),
  );
}
