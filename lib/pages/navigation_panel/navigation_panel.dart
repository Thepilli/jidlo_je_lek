import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacionar_app/constants/colors.dart';
import 'package:stacionar_app/model/meal_plans.dart';

import '../application_page/app_grid.dart';
import '../dictionary_tab_page/dictionary_page.dart';
import '../help_resources/help_page.dart';
import '../meal_plan/meal_plan_screen.dart';
import 'navigation_panel_builder.dart';

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  State<TabPage> createState() => _TabPageState();
}

// EXIT DIAGLOG BOX
class _TabPageState extends State<TabPage> {
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Opravdu chceš odejít?', style: Theme.of(context).textTheme.headlineLarge),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Ne'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Ano'),
          ),
        ],
      ),
    ).then((value) => value ?? false);
  }

  // my tabs
  List<Widget> myTabs = [
    const TabPageBuilder(
      label: 'Články',
      iconPath: 'assets/icons/tab_icon_dictionary.png',
    ), // blog tab
    const TabPageBuilder(
      label: 'Jídelní \nplán',
      iconPath: 'assets/icons/tab_icon_plan.png',
    ), // plan tab
    const TabPageBuilder(
      label: 'Applikace',
      iconPath: 'assets/icons/tab_icon_app.png',
    ), // app tab
    const TabPageBuilder(
      label: 'Odkazy',
      iconPath: 'assets/icons/tab_icon_help.png',
    ), // help tab
  ];

  @override
  Widget build(BuildContext context) {
    var isDark = Get.isDarkMode;
    var tabColor = isDark ? jPrimaryDarkColor : jPrimaryLightColor;
    var iconColor = isDark ? jPrimaryDarkColor : jPrimaryLightColor;
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: DefaultTabController(
        length: myTabs.length,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: iconColor),
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text('Stacionář', style: Theme.of(context).textTheme.headlineMedium),
            actions: [
              IconButton(
                onPressed: () {
                  Get.changeThemeMode(isDark ? ThemeMode.light : ThemeMode.dark);
                },
                icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode_outlined),
                color: (isDark ? Colors.amber : Colors.amber),
              ),
              // Container(
              //   margin: const EdgeInsets.only(right: 20, top: 7),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     //For Dark Color
              //     color: isDark ? jSecondaryDarkColor : jCardBgColor,
              //   ),
              //   child: IconButton(onPressed: () {}, icon: const Image(image: AssetImage("assets/images/pika.png"))),
              // )
            ],
          ),
          body: SafeArea(
            child: Column(
              children: [
                TabBar(
                  tabs: myTabs,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: tabColor,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      const DictionaryPage(),
                      MealPlanScreen(mealList: getMealList()),
                      const ApplicationGrid(),
                      const HelpPage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
