import 'dart:convert';

import 'package:get/get.dart';
import 'package:stacionar_app/constants/colors.dart';
import 'package:stacionar_app/model/article_drawer.dart';
import 'package:stacionar_app/features/core/navigation_tabs/articles/articles_navigation/article_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:side_menu_animation/side_menu_animation.dart';
import 'package:stacionar_app/features/core/home_page/home_page_navigation.dart';

class ArticleNavigationPage extends StatefulWidget {
  const ArticleNavigationPage({Key? key}) : super(key: key);

  @override
  _ArticleNavigationPageState createState() => _ArticleNavigationPageState();
}

class _ArticleNavigationPageState extends State<ArticleNavigationPage> {
  late Future<List<Article>> _articlesFuture;
  int _selectedTopicSection = 1;
  final _index = ValueNotifier<int>(1);

  @override
  void initState() {
    super.initState();
    _articlesFuture = ArticleRepository().getArticles(_selectedTopicSection);
  }

  void _updateArticles(int topicSection) {
    setState(() {
      _selectedTopicSection = topicSection;
      _articlesFuture = ArticleRepository().getArticles(_selectedTopicSection);
    });
  }

  @override
  Widget build(BuildContext context) {
    var isDark = Get.isDarkMode;
    var iconColor = isDark ? jPrimaryDarkColor : jPrimaryLightColor;
    var containerBorderColor = isDark ? jPrimaryDarkContainerColor : jPrimaryLightContainerColor;
    return Scaffold(
      body: SideMenuAnimation.builder(
        curveAnimation: Curves.linear,
        tapOutsideToDismiss: true,
        builder: (showMenu) {
          return Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '<<Další články',
                    style: TextStyle(color: Colors.black54),
                  ),
                  ValueListenableBuilder<int>(
                    valueListenable: _index,
                    builder: (_, value, __) => Text(
                      myMenuValue[value].title,
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
              leading: IconButton(
                icon: const Icon(
                  Icons.menu_book_rounded,
                  color: Colors.black54,
                  size: 50,
                ),
                onPressed: showMenu,
              ),
              backgroundColor: iconColor,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle.light,
              centerTitle: true,
            ),
            body: FutureBuilder<List<Article>>(
              future: _articlesFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final article = snapshot.data![index];
                      return ArticleContainerWidget(article: article);
                    },
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
          );
        },
        enableEdgeDragGesture: true,
        items: myMenuValue
            .map((value) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(value.icon, width: 50, height: 50),
                    Text(value.title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelLarge),
                  ],
                ))
            .toList(),
        selectedColor: iconColor,
        unselectedColor: containerBorderColor,
        onItemSelected: (value) {
          if (value > 0 && value != _selectedTopicSection) {
            _updateArticles(value);
          }
          if (value > 0 && value != _index.value) _index.value = value;

          if (value == 6) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return const HomePageNavigator();
            }));
          }
        },
      ),
    );
  }
}

class Article {
  final String title;
  final String image;
  final String bodyArticle;
  final int topicSection;

  Article({
    required this.title,
    required this.image,
    required this.bodyArticle,
    required this.topicSection,
  });
}

class ArticleRepository {
  Future<List<Article>> getArticles(int selectedItem) async {
    final jsonStr = await rootBundle.loadString('assets/articles.JSON');
    final List<dynamic> jsonList = jsonDecode(jsonStr);

    return jsonList
        .where((json) => json['topicSection'] == selectedItem)
        .map((json) => Article(
              title: json['title'],
              image: json['image'],
              bodyArticle: json['bodyArticle'],
              topicSection: json['topicSection'],
            ))
        .toList();
  }
}
