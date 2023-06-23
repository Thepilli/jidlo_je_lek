import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacionar_app/constants/colors.dart';
import 'package:stacionar_app/features/core/home_page/navigation_tabs/applications_list/applications/fortune_wheel/widgets/fortune_wheel_controller.dart';

class FortuneWheelPage extends StatefulWidget {
  const FortuneWheelPage({Key? key}) : super(key: key);

  @override
  _FortuneWheelPageState createState() => _FortuneWheelPageState();
}

class _FortuneWheelPageState extends State<FortuneWheelPage> {
  FortuneWheelController<int> fortuneWheelController = FortuneWheelController();
  FortuneWheelModel<int>? currentWheelChild;
  int currentBalance = 0;
  bool isAnimationFinished = false; // Added a flag to track animation finish

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
        isAnimationFinished = true; // Set the flag to true when animation finishes
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isDark = Get.isDarkMode;
    var iconColor = isDark ? jPrimaryDarkColor : jPrimaryLightColor;
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: iconColor),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            "Co si dneska dám?",
            style: Theme.of(context).textTheme.displayLarge,
          )),
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
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        "Máš problém neustále vybírat jaké pečivo si dát? Pak tahle je aplikace pro tebe!",
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Image name
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SizedBox(
                            height: 120,
                            width: 120,
                            child: isAnimationFinished && currentWheelChild != null
                                ? currentWheelChild!.title
                                : const SizedBox(),
                          ),
                        ),
                        // Image path
                        SizedBox(
                          height: 120,
                          width: 120,
                          child: currentWheelChild != null ? currentWheelChild!.foreground : Container(),
                        ),
                        // Button
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SizedBox(
                            height: 50,
                            width: 120,
                            child: ElevatedButton(
                              onPressed: () {
                                fortuneWheelController.rotateTheWheel();
                                setState(() {
                                  isAnimationFinished = false; // Set the flag to false when button is pressed
                                });
                              },
                              child: Text(
                                'Roztoč mě!',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
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
                            'Brioška',
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
                            'Chléb příborský',
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
                            'Croissant máslový',
                            'croissan_maslovy.png',
                          ),
                          _createFortuneWheelChild(
                            'Dalamánek',
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
                            'Loupák',
                            'loupak.png',
                          ),
                          _createFortuneWheelChild(
                            'Rohlík',
                            'rohlik1.png',
                          ),
                          _createFortuneWheelChild(
                            'Rohlík',
                            'rohlik3.png',
                          ),
                          _createFortuneWheelChild(
                            'Rohlík',
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
          ),
        ),
      ),
    );
  }

  FortuneWheelModel<int> _createFortuneWheelChild(String imgName, String imgPath) {
    Color color = Colors.teal.withOpacity(0.5);
    String name = imgName;
    String image = imgPath;

    return FortuneWheelModel(
      foreground: _getWheelContentCircle(color, name, image),
      title: _getWheelContentCircleTitle(name, image),
    );
  }

  Container _getWheelContentCircle(Color backgroundColor, String text, String image) {
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
        ),
      ),
    );
  }

  Container _getWheelContentCircleTitle(String text, String image) {
    return Container(
      child: Center(
        child: Text(
          '$text!',
          style: Theme.of(context).textTheme.headlineLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
