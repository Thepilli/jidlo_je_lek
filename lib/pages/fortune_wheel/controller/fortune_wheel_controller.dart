import 'package:flutter/widgets.dart';

import '../widgets/fortune_wheel_child.dart';

class FortuneWheelController<T> extends ChangeNotifier {
  FortuneWheelChild<T>? value;

  bool isAnimating = false;
  bool shouldStartAnimation = false;
  bool isFinishedAnimating = false;

  void rotateTheWheel() {
    shouldStartAnimation = true;
    notifyListeners();
  }

  void animationStarted() {
    shouldStartAnimation = false;
    isAnimating = true;
  }

  void setValue(FortuneWheelChild<T> fortuneWheelChild) {
    value = fortuneWheelChild;
    isFinishedAnimating = true;
    notifyListeners();
  }

  void animationFinished() {
    isAnimating = false;
    isFinishedAnimating = true;
    shouldStartAnimation = false;
    notifyListeners();
  }
}
