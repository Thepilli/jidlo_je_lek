import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ArticleList extends StatefulWidget {
  const ArticleList({super.key});

  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  late Future<List<Article>> _articlesFuture;

  @override
  void initState() {
    super.initState();
    _articlesFuture = ArticleRepository().getArticles();
  }

// Builds the list of article containers
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future: _articlesFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final article = snapshot.data![index];
              return null;
              // return ArticleContainer(article: article);
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
    );
  }
}

class Article {
  final String title;
  final String image;
  final String bodyArticle;
  final String topicSection;

  Article(
      {required this.title,
      required this.image,
      required this.bodyArticle,
      required this.topicSection});
}

class ArticleRepository {
  Future<List<Article>> getArticles() async {
    final jsonStr = await rootBundle.loadString('assets/articles.JSON');
    final List<dynamic> jsonList = jsonDecode(jsonStr);

    return jsonList
        .where((json) => json['topicSection'] == "Section2")
        .map((json) => Article(
              title: json['title'],
              image: json['image'],
              bodyArticle: json['bodyArticle'],
              topicSection: json['topicSection'],
            ))
        .toList();
  }
}
