import 'package:flutter/material.dart';
import 'package:stacionar_app/pages/bmi/bmi_calculator_screen.dart';
import 'package:stacionar_app/pages/food_menu/food_menu_screen.dart';
import 'package:stacionar_app/pages/fortune_wheel/demo_screen.dart';

import '../articles/article_list.dart';
import '../meal_plan/meal_plan_screen.dart';
import 'my_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Article>> _articlesFuture;
  // my tabs
  List<Widget> myTabs = const [
    // blog tab
    MyTab(iconPath: 'assets/icons/icon_blog.png'),
    // bmi tab
    MyTab(iconPath: 'assets/icons/icon_bmi.png'),
    // plan tab
    MyTab(iconPath: 'assets/icons/icon_plan.png'),
    // calendar tab
    MyTab(iconPath: 'assets/icons/icon_calendar.png'),
    // faq tab
    MyTab(iconPath: 'assets/icons/icon_faq.png'),
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
                          const ArticleList(),
                          const BmiCalculator(),
                          MealTab(),
                          const FoodMenuScreen(),
                          const DemoScreen(),
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
