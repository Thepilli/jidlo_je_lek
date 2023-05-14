import 'dart:convert';

import 'package:stacionar_app/pages/articles/article_container.dart';

import '../tab_page/tab_page.dart';
import 'article_navigation_menu_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:side_menu_animation/side_menu_animation.dart';

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
    return Scaffold(
      body: SideMenuAnimation.builder(
        curveAnimation: Curves.linear,
        tapOutsideToDismiss: true,
        builder: (showMenu) {
          return Scaffold(
            appBar: AppBar(
              title: ValueListenableBuilder<int>(
                valueListenable: _index,
                builder: (_, value, __) => Text(myMenuValue[value].title,
                    style: const TextStyle(color: Colors.black)),
              ),
              leading: IconButton(
                  icon: const Icon(Icons.menu_book_rounded,
                      color: Colors.black, size: 50),
                  onPressed: showMenu),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                      return ArticleContainer(article: article);
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
            .map((value) =>
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset(value.icon, width: 50, height: 50),
                  Text(value.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold))
                ]))
            .toList(),
        selectedColor: const Color(0xFF1CDE8F),
        unselectedColor: const Color(0xFFA0E5C9),
        onItemSelected: (value) {
          if (value > 0 && value != _selectedTopicSection) {
            _updateArticles(value);
          }
          if (value > 0 && value != _index.value) _index.value = value;

          if (value == 6) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const TabPage();
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
