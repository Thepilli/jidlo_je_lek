import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacionar_app/constants/colors.dart';
import 'package:stacionar_app/features/core/home_page/home_page_navigation_builder.dart';
import 'package:stacionar_app/features/core/navigation_tabs/applications_list/applications_list.dart';
import 'package:stacionar_app/features/core/navigation_tabs/articles/articles_page.dart';
import 'package:stacionar_app/features/core/navigation_tabs/meal_plan/meal_plan_screen.dart';
import 'package:stacionar_app/features/core/navigation_tabs/resources/help_page.dart';
import 'package:stacionar_app/model/meal_plans.dart';
import 'package:stacionar_app/widgets/contrained_container.dart';

class HomePageNavigator extends StatefulWidget {
  const HomePageNavigator({Key? key}) : super(key: key);

  @override
  State<HomePageNavigator> createState() => _HomePageNavigatorState();
}

// EXIT DIAGLOG BOX
class _HomePageNavigatorState extends State<HomePageNavigator> {
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
    const HomePageNavigationBuilder(
      label: 'Články',
      iconPath: 'assets/icons/tab_icon_dictionary.png',
    ), // blog tab
    const HomePageNavigationBuilder(
      label: 'Jídelní \nplán',
      iconPath: 'assets/icons/tab_icon_plan.png',
    ), // plan tab
    const HomePageNavigationBuilder(
      label: 'Applikace',
      iconPath: 'assets/icons/tab_icon_app.png',
    ), // app tab
    const HomePageNavigationBuilder(
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
            // centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Padding(
              padding: const EdgeInsets.only(left: 200),
              child: Text('Stacionář', style: Theme.of(context).textTheme.headlineMedium),
            ),
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
          body: ConstrainedContainer(
            child: SafeArea(
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
                        const ArticlesPage(),
                        MealPlanScreen(mealList: getMealList()),
                        const ApplicationsList(),
                        const HelpPage(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
