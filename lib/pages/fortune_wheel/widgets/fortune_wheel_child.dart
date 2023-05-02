import 'package:flutter/widgets.dart';

class FortuneWheelChild<T> {
  FortuneWheelChild({
    required this.foreground,
    this.background,
  });

  final Widget foreground;
  final Color? background;
}
