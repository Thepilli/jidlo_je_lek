import 'package:flutter/material.dart';
import 'package:stacionar_app/utils/app_theme.dart';

import '../article_navigationbar_page/article_navigation_page.dart';
import 'article_page.dart';

class ArticleContainer extends StatelessWidget {
  final Article article;

  const ArticleContainer({
    Key? key,
    required this.article,
  }) : super(key: key);

// Builds the article container
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ArticlePage(
                title: article.title,
                image: article.image,
                bodyArticle: article.bodyArticle,
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: CustomTheme.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
                height: 100, width: 150, child: Image.asset(article.image)),
            Flexible(
                child: Text(
              article.title,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.clip,
            )),
          ],
        ),
      ),
    );
  }
}
