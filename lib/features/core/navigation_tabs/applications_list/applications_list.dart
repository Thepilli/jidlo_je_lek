import 'package:flutter/material.dart';
import 'package:stacionar_app/features/core/navigation_tabs/applications_list/applications/BMI/bmi_calculator_screen.dart';
import 'package:stacionar_app/features/core/navigation_tabs/applications_list/applications/fortune_wheel/fortune_wheel_page.dart';
import 'package:stacionar_app/features/core/navigation_tabs/applications_list/applications/relaxation/relaxation_list.dart';
import 'package:stacionar_app/features/core/navigation_tabs/applications_list/applications/stacionar_menu/stacionar_menu.dart';
import 'package:stacionar_app/features/core/navigation_tabs/applications_list/applications/video_player/video_list.dart';
import 'package:stacionar_app/features/core//navigation_tabs/applications_list/applications/meal_inspiration/meal_inspiration.dart';

class ApplicationsList extends StatefulWidget {
  const ApplicationsList({Key? key}) : super(key: key);

  @override
  State<ApplicationsList> createState() => _ApplicationsListState();
}

class _ApplicationsListState extends State<ApplicationsList> {
  String features = 'Tady najdeš aplikace které ti pomohou nebo tě alespoň pobaví při každodenních aktivitách';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    features,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                primary: true,
                crossAxisCount: 1,
                crossAxisSpacing: 0,
                scrollDirection: Axis.vertical,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                childAspectRatio: 3.5,
                padding: const EdgeInsets.only(left: 24, right: 24),
                children: [
                  itemTile(
                    context,
                    'assets/icons/tab_icon_bmi.png',
                    'Kalkulačka BMI',
                    'Výpočet BMI je velmi snadný, postačí ti k němu tovje váha a výška',
                    'BmiCalculator',
                  ),
                  itemTile(
                    context,
                    'assets/icons/tab_icon_calendar.png',
                    'Týdenní jídelníček',
                    'Zajímá tě jaký jídelníček máme na tento týden?',
                    'FoodMenuScreen',
                  ),
                  itemTile(
                    context,
                    'assets/icons/tab_icon_loterry.png',
                    'Pečivová ruleta',
                    'Nebaví tě lámat si hlavu tím, jaké pečivo se dnes dáš?',
                    'FortuneWheelPage',
                  ),
                  itemTile(
                    context,
                    'assets/icons/tab_icon_gallery.png',
                    'Jídelní inspirace',
                    'Nebo jen hledáš inspiraci co si naplánovat? Zkus se podívat do galerie',
                    'VerticalSliderDemo',
                  ),
                  itemTile(
                    context,
                    'assets/icons/tab_icon_relaxation.png',
                    'Relaxační nahrávky',
                    'Potřebuješ se uklidnit? Zkus si pustit některou z našich relaxačních nahrávek',
                    'RelaxationList',
                  ),
                  itemTile(
                    context,
                    'assets/icons/tab_icon_pusheen.png',
                    'Příběhy Pušínka',
                    'Máš chvilu a potřebuješ se odreagovat? Zkus si pustit některý z příběhů Pušínka',
                    'VideoList',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget itemTile(BuildContext context, String iconPath, String title, String description, String pageName) {
  return ListTile(
    horizontalTitleGap: 30,
    onTap: () {
      String nextPage = pageName; // Replace 'ArticleNavigationPage' with the desired page name

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => getPageByName(nextPage),
        ),
      );
    },
    leading: Image.asset(
      iconPath,
    ),
    title: Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Text(title, style: Theme.of(context).textTheme.headlineMedium),
    ),
    subtitle: Column(
      children: [
        Text(
          description,
          style: Theme.of(context).textTheme.headlineSmall,
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
    return const StacionarMenu();
  }
  if (pageName == 'FortuneWheelPage') {
    return const FortuneWheelPage();
  }
  if (pageName == 'RelaxationList') {
    return const RelaxationList();
  }
  if (pageName == 'VideoList') {
    return const VideoList();
  }
  if (pageName == 'VerticalSliderDemo') {
    return const MealInspiration(
      meals: [],
    );
  }
  // Add more conditions for other page names if needed
  return Container(); // Default return value if no matching page name is found
}
