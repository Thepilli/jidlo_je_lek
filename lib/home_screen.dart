import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacionar_app/bmi_calculator_screen.dart';
import 'package:stacionar_app/food_menu_screen.dart';
import 'package:stacionar_app/mealplan_screen.dart';
import 'package:stacionar_app/resources.dart';
import 'package:stacionar_app/widgets/article_container.dart';
import 'package:stacionar_app/widgets/my_tab.dart';

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
    MyTab(
      iconPath: 'assets/icons/icon_blog.png',
    ),
    // bmi tab
    MyTab(
      iconPath: 'assets/icons/icon_bmi.png',
    ),
    // plan tab
    MyTab(
      iconPath: 'assets/icons/icon_plan.png',
    ),
    // calendar tab
    MyTab(
      iconPath: 'assets/icons/icon_calendar.png',
    ),
    // faq tab
    MyTab(
      iconPath: 'assets/icons/icon_faq.png',
    ),
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
                          ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final article = snapshot.data![index];
                              return ArticleContainer(article: article);
                            },
                          ),
                          const BmiCalculator(),
                          MealTab(),
                          const FoodMenuScreen(),
                          const NewsHomeOnePage(),
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

class Article {
  final String title;
  final String image;
  final String bodyArticle;

  Article(
      {required this.title, required this.image, required this.bodyArticle});
}

class ArticleRepository {
  Future<List<Article>> getArticles() async {
    final jsonStr = await rootBundle.loadString('assets/articles.JSON');
    final List<dynamic> jsonList = jsonDecode(jsonStr);

    return jsonList
        .map((json) => Article(
              title: json['title'],
              image: json['image'],
              bodyArticle: json['bodyArticle'],
            ))
        .toList();
  }
}
