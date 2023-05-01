import 'dart:convert';

import 'package:stacionar_app/pages/articles/article_container.dart';

import 'menu_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:side_menu_animation/side_menu_animation.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  late Future<List<Article>> _articlesFuture;
  int _selectedTopicSection = 1;

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
        tapOutsideToDismiss: true,
        builder: (showMenu) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Article List'),
              leading: IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black),
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
            .map((value) => Icon(value.icon, color: Colors.white, size: 50))
            .toList(),
        selectedColor: const Color(0xFFFF595E),
        unselectedColor: const Color(0xFF1F2041),
        onItemSelected: (value) {
          if (value > 0 && value != _selectedTopicSection) {
            _updateArticles(value);
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
