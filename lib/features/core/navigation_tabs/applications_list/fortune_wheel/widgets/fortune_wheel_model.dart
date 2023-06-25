import 'package:flutter/widgets.dart';

class FortuneWheelModel<T> {
  FortuneWheelModel({
    required this.foreground,
    this.background,
    this.title,
  });

  final Widget foreground;
  final Color? background;
  final Widget? title;
}
