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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                        flex: 5,
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
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: SizedBox(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Theme.of(context).primaryColor),
                            ),
                            onPressed: () =>
                                fortuneWheelController.rotateTheWheel(),
                            child: const Text('Roztoč mě!'),
                          ),
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
                        _createFortuneWheelChild(
                          'Bageta fit',
                          'bageta_fit.png',
                        ),
                        _createFortuneWheelChild(
                          'Brioška ',
                          'brioska.png',
                        ),
                        _createFortuneWheelChild(
                          'Bulka sezamova',
                          'bulka_sezamova.png',
                        ),
                        _createFortuneWheelChild(
                          'Chléb kmínáček',
                          'chleb_kminacek_krajeny_maly.png',
                        ),
                        _createFortuneWheelChild(
                          'Chléb příborský ',
                          'chleb_priborsky.png',
                        ),
                        _createFortuneWheelChild(
                          'Chléb sedlácký',
                          'chleb_sedlacky.png',
                        ),
                        _createFortuneWheelChild(
                          'Chléb žitný',
                          'chleb_zitny_krajeny.png',
                        ),
                        _createFortuneWheelChild(
                          'Croissant máslový ',
                          'croissan_maslovy.png',
                        ),
                        _createFortuneWheelChild(
                          'Dalamánek ',
                          'dalamanek2.png',
                        ),
                        _createFortuneWheelChild(
                          'Houska',
                          'houska3.png',
                        ),
                        _createFortuneWheelChild(
                          'Houska',
                          'houska_lnena.png',
                        ),
                        _createFortuneWheelChild(
                          'Hřeben makový',
                          'hreben_makovy.png',
                        ),
                        _createFortuneWheelChild(
                          'Koláč makový',
                          'kolac_mak.png',
                        ),
                        _createFortuneWheelChild(
                          'Loupák ',
                          'loupak.png',
                        ),
                        _createFortuneWheelChild(
                          'Rohlík ',
                          'rohlik1.png',
                        ),
                        _createFortuneWheelChild(
                          'Rohlík ',
                          'rohlik3.png',
                        ),
                        _createFortuneWheelChild(
                          'Rohlík ',
                          'rohlik4.png',
                        ),
                        _createFortuneWheelChild(
                          'Rohlík cerální',
                          'rohlik_ceralni.png',
                        ),
                        _createFortuneWheelChild(
                          'Rohlik grahamový',
                          'rohlik_grahamovy.png',
                        ),
                        _createFortuneWheelChild(
                          'Veka',
                          'veka.png',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
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
