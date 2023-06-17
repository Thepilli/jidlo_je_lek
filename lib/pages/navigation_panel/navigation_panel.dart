import 'package:flutter/material.dart';
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

class _TabPageState extends State<TabPage> {
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm'),
        content: const Text('Do you want to exit the app?'),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () => Navigator.pop(context, false),
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary),
            child: const Text('No'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary),
            child: const Text('Yes'),
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
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: DefaultTabController(
        length: myTabs.length,
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                TabBar(
                  tabs: myTabs,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.secondary,
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
