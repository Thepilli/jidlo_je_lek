import 'package:flutter/material.dart';
import 'package:stacionar_app/pages/bmi/bmi_calculator_screen.dart';
import 'package:stacionar_app/pages/food_menu/food_menu_screen.dart';

import '../articles/article_list.dart';
import '../fortune_wheel/fortune_wheel_page.dart';
import '../meal_plan/meal_plan_screen.dart';
import '../roulette/roulette_homepage.dart';
import 'tab_page_builder.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  late Future<List<Article>> _articlesFuture;
  // my tabs
  List<Widget> myTabs = const [
    TabPageBuilder(iconPath: 'assets/icons/icon_blog.png'), // blog tab
    TabPageBuilder(iconPath: 'assets/icons/icon_bmi.png'), // bmi tab
    TabPageBuilder(iconPath: 'assets/icons/icon_plan.png'), // plan tab
    TabPageBuilder(iconPath: 'assets/icons/icon_calendar.png'), // calendar tab
    TabPageBuilder(iconPath: 'assets/icons/icon_faq.png'), // faq tab
  ];
  @override
  void initState() {
    super.initState();
    _articlesFuture = ArticleRepository().getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        body: SafeArea(
          child: FutureBuilder<List<Article>>(
            future: _articlesFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    TabBar(tabs: myTabs),
                    Expanded(
                      child: TabBarView(
                        children: [
                          const RouletteHomePage(),
                          const BmiCalculator(),
                          MealTab(),
                          const FoodMenuScreen(),
                          const FortuneWheelPage(),
                        ],
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
