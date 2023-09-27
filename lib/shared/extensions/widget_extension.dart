import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget paddingHorizontal(double val) => Padding(padding: EdgeInsets.symmetric(horizontal: val), child: this);
}
