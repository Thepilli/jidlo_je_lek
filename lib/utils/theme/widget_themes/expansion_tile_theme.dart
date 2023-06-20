import 'package:flutter/material.dart';
import 'package:stacionar_app/constants/colors.dart';
import 'package:stacionar_app/constants/sizes.dart';

class JExpansionTileTheme {
  JExpansionTileTheme._();

  static final lightExpansionTileTheme = ExpansionTileThemeData(
      backgroundColor: jPrimaryLightContainerColor,
      collapsedBackgroundColor: jPrimaryLightColor,
      textColor: Colors.white70,
      collapsedTextColor: Colors.white70,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(jBorderRadius),
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(jBorderRadius),
      ),
      iconColor: Colors.black54,
      collapsedIconColor: Colors.black54);

  static final darkExpansionTileTheme = ExpansionTileThemeData(
      backgroundColor: jPrimaryDarkContainerColor,
      collapsedBackgroundColor: jPrimaryDarkColor,
      textColor: Colors.white70,
      collapsedTextColor: Colors.white70,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(jBorderRadius),
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(jBorderRadius),
      ),
      iconColor: Colors.black54,
      collapsedIconColor: Colors.black54);
}
