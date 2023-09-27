import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacionar_app/models/article.dart';
import 'package:stacionar_app/router/app_router.dart';
import 'package:stacionar_app/shared/extensions/build_context.dart';

class ArticleContainerWidget extends StatelessWidget {
  final Article article;

  const ArticleContainerWidget({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(Routes.articleDetail.name, extra: article),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        width: 200,
        decoration: BoxDecoration(
          color: context.primary,
          borderRadius: BorderRadius.circular(15),
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
              height: 100,
              width: 150,
              child: Image.asset(article.image),
            ),
            Flexible(
              child: Text(
                article.title,
                style: context.textTheme.bodyLarge,
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
