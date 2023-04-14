import 'package:flutter/material.dart';
import 'package:stacionar_app/utils/colors.dart' as color;

class MyTextStyles {
  static const TextStyle headline1 = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Color.fromRGBO(201, 76, 76, 0.6));

  static const TextStyle headline3 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  );
  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const TextStyle bodyText2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static TextStyle subtitle1 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: color.Colors.disableColor,
  );
  static TextStyle subtitle2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: color.Colors.accentColor,
  );
}
