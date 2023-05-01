import 'package:flutter/material.dart';

import 'widgets/fortune_wheel.dart';

class FortuneWheelPage extends StatefulWidget {
  const FortuneWheelPage({super.key});

  @override
  _FortuneWheelPageState createState() => _FortuneWheelPageState();
}

class _FortuneWheelPageState extends State<FortuneWheelPage> {
  FortuneWheelController<int> fortuneWheelController = FortuneWheelController();
  FortuneWheelChild? currentWheelChild;
  int currentBalance = 0;

  @override
  void initState() {
    fortuneWheelController.addListener(() {
      if (fortuneWheelController.value == null) {
        return;
      }

      setState(() {
        currentWheelChild = fortuneWheelController.value;
      });

      if (fortuneWheelController.isAnimating) {
        return;
      }

      if (fortuneWheelController.shouldStartAnimation) {
        return;
      }

      setState(() {
        currentBalance += fortuneWheelController.value!.value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: currentWheelChild != null
                        ? currentWheelChild!.foreground
                        : Container(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                      width: 350,
                      height: 350,
                      child: FortuneWheel<int>(
                        controller: fortuneWheelController,
                        children: [
                          _createFortuneWheelChild(-50),
                          _createFortuneWheelChild(1000),
                          _createFortuneWheelChild(-50),
                          _createFortuneWheelChild(-500),
                          _createFortuneWheelChild(-100),
                          _createFortuneWheelChild(-100),
                          _createFortuneWheelChild(-100),
                        ],
                      )),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            // Use the controller to run the animation with rollTo method
            onPressed: () => fortuneWheelController.rotateTheWheel(),

            child: const Icon(Icons.refresh_rounded),
          )),
    );
  }

  FortuneWheelChild<int> _createFortuneWheelChild(int value) {
    Color color = value.isNegative ? Colors.red : Colors.green;
    String verb = value.isNegative ? 'Lose' : 'Win';
    int valueString = value.abs();

    return FortuneWheelChild(
        foreground: _getWheelContentCircle(color, '$verb\n$valueString €'),
        value: value);
  }

  Container _getWheelContentCircle(Color backgroundColor, String text) {
    return Container(
      width: 72,
      height: 72,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.8), width: 4)),
      child: Center(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
