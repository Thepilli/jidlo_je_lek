import 'package:flutter/material.dart';

import 'dev_carousel.dart';
import 'pages/bmi/bmi_calculator_screen.dart';
import 'pages/food_menu/food_menu_screen.dart';
import 'pages/fortune_wheel/fortune_wheel_page.dart';

class ApplicationGrid extends StatefulWidget {
  const ApplicationGrid({super.key});

  @override
  State<ApplicationGrid> createState() => _ApplicationGridState();
}

class _ApplicationGridState extends State<ApplicationGrid> {
  String features =
      'Tady najdeš aplikace které ti pomohou nebo tě alespoň pobaví při každodenních aktivitách';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              features,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          GridView.count(
            primary: true,
            crossAxisCount: 1,
            crossAxisSpacing: 0,
            scrollDirection: Axis.vertical,
            mainAxisSpacing: 10,
            shrinkWrap: true,
            childAspectRatio: 3,
            padding: const EdgeInsets.only(left: 24, right: 24),
            children: [
              itemTile(
                  context,
                  'assets/icons/tab_icon_bmi.png',
                  'Kalkulačka bmi',
                  'Výpočet BMI je velmi snadný, postačí ti k němu tovje váha a výška',
                  'BmiCalculator'),
              itemTile(
                  context,
                  'assets/icons/tab_icon_calendar.png',
                  'Týdenní jídelníček',
                  'Zajímá tě jaký jídelníček máme na tento týden?',
                  'FoodMenuScreen'),
              itemTile(
                  context,
                  'assets/icons/tab_icon_loterry.png',
                  'Pečivová ruleta',
                  'Nebaví tě lámat si hlavu si tím, jaké pečivo se dnes dáš?',
                  'FortuneWheelPage'),
              itemTile(
                  context,
                  'assets/icons/tab_icon_gallery.png',
                  'Jídelní inspirace',
                  'Nebo jen hledáš inspiraci co si naplánovat? Zkus se podívat do galerie',
                  'VerticalSliderDemo'),
            ],
          ),
        ],
      ),
    );
  }
}

Widget itemTile(BuildContext context, String iconPath, String title,
    String description, String pageName) {
  return ListTile(
    tileColor: Colors.greenAccent.withOpacity(0.5),
    onTap: () {
      String nextPage =
          pageName; // Replace 'ArticleNavigationPage' with the desired page name

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => getPageByName(nextPage),
        ),
      );
    },
    leading: SizedBox(
      width: 100,
      height: 100,
      child: Image.asset(iconPath),
    ),
    title: Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Text(
        title,
      ),
    ),
    subtitle: Column(
      children: [
        Text(
          description,
        ),
      ],
    ),
  );
}

Widget getPageByName(String pageName) {
  // Add your logic to return the appropriate widget based on the page name
  // For example:
  if (pageName == 'BmiCalculator') {
    return const BmiCalculator();
  }
  if (pageName == 'FoodMenuScreen') {
    return const FoodMenuScreen();
  }
  if (pageName == 'FortuneWheelPage') {
    return const FortuneWheelPage();
  }
  if (pageName == 'VerticalSliderDemo') {
    return const VerticalSliderDemo(
      meals: [],
    );
  }
  // Add more conditions for other page names if needed
  return Container(); // Default return value if no matching page name is found
}
