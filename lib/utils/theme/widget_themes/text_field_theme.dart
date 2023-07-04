import 'package:stacionar_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:stacionar_app/constants/sizes.dart';

class JTextFormFieldTheme {
  JTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
    prefixIconColor: jPrimaryLightContainerColor,
    hintStyle: const TextStyle(color: jPrimaryLightColor),
    labelStyle: const TextStyle(color: jPrimaryLightColor),
    contentPadding: const EdgeInsets.only(left: jPadding25),
    alignLabelWithHint: true,
    floatingLabelStyle: const TextStyle(color: jPrimaryLightColorShade),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(width: 2, color: jPrimaryLightColorShade),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
    prefixIconColor: jPrimaryDarkContainerColor,
    hintStyle: const TextStyle(color: jPrimaryDarkColor),
    labelStyle: const TextStyle(color: jPrimaryLightColor),
    contentPadding: const EdgeInsets.only(left: jPadding25),
    alignLabelWithHint: true,
    floatingLabelStyle: const TextStyle(color: jPrimaryDarkColorShade),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(width: 2, color: jPrimaryDarkColorShade),
    ),
  );
}
