import 'package:flutter/widgets.dart';

class FortuneWheelChild<T> {
  FortuneWheelChild({
    required this.foreground,
    this.background,
    this.title,
  });

  final Widget foreground;
  final Color? background;
  final Widget? title;
}
