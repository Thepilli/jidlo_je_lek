import 'package:flutter/material.dart';
import 'package:stacionar_app/utils/mytextstyles.dart';

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
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Co si dneska dám?",
                style: MyTextStyles.headline1,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Máš problém neustále vybírat jaké pečivo si dát? Pak tohle je aplikace pro tebe!",
                style: MyTextStyles.bodyText1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: currentWheelChild != null
                        ? currentWheelChild!.foreground
                        : Container(),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  SizedBox(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor),
                      ),
                      onPressed: () => fortuneWheelController.rotateTheWheel(),
                      child: const Text('Roztoč mě!'),
                    ),
                  ),
                ],
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
                    _createFortuneWheelChild('Rohlik', 'rohlik1.png'),
                    _createFortuneWheelChild('Houska', 'houska3.png'),
                    _createFortuneWheelChild(
                        'Ceralni rohlik', 'rohlik_ceralni.png'),
                    _createFortuneWheelChild('Dalamanek', 'dalamanek2.png'),
                    _createFortuneWheelChild('Rohlik', 'rohlik4.png'),
                    _createFortuneWheelChild('Veka', 'veka.png'),
                    _createFortuneWheelChild('Houska', 'houska2.png'),
                    _createFortuneWheelChild('Rohlik', 'rohlik5.png'),
                    _createFortuneWheelChild(
                        'Sezamova bulka', 'bulka_sezamova.png'),
                    _createFortuneWheelChild(
                        'Houska lnena', 'houska_lnena.png'),
                    _createFortuneWheelChild(
                        'Grahamovy rohlik', 'rohlik_grahamovy.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  FortuneWheelChild<int> _createFortuneWheelChild(String type, String imgPath) {
    Color color = Colors.teal.withOpacity(0.5);
    String verb = type;
    String image = imgPath;

    return FortuneWheelChild(
      foreground: _getWheelContentCircle(color, verb, image),
    );
  }

  Container _getWheelContentCircle(
      Color backgroundColor, String text, String image) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(
          child: Image.asset(
        'assets/images/pecivo/$image',
      )),
    );
  }
}
