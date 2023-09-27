import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:side_menu_animation/side_menu_animation.dart';
import 'package:stacionar_app/app/app_colors.dart';
import 'package:stacionar_app/features/core/navigation_tabs/articles/articles_navigation/widgets/article_container_widget.dart';
import 'package:stacionar_app/features/core/navigation_tabs/articles/articles_navigation/widgets/drawer_index_provider.dart';
import 'package:stacionar_app/models/article.dart';
import 'package:stacionar_app/models/article_drawer.dart';
import 'package:stacionar_app/shared/extensions/build_context.dart';

class ArticleListPage extends ConsumerWidget {
  const ArticleListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int drawerIndex = ref.watch(drawerIndexProvider);
    List<Article> articleTopicList = articles.where((element) => element.topicSection == drawerIndex).toList();

    return Scaffold(
      body: SideMenuAnimation.builder(
        scrimColor: AppColors.white.withOpacity(.3),
        curveAnimation: Curves.easeIn,
        tapOutsideToDismiss: true,
        enableEdgeDragGesture: true,
        selectedColor: context.primary,
        unselectedColor: context.background,
        items: List.generate(
          drawerItems.length,
          (index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(drawerItems[index].icon, width: 50, height: 50),
              Text(drawerItems[index].title, textAlign: TextAlign.center, style: context.textTheme.bodyMedium),
            ],
          ),
        ),
        onItemSelected: (value) {
          if (value == 5) {
            context.pop();
          }
          ref.read(drawerIndexProvider.notifier).updateIndex(value);
        },
        builder: (showMenu) {
          return Scaffold(
            appBar: AppBar(
              leadingWidth: 150,
              title: Text(drawerItems[drawerIndex].title, style: context.textTheme.bodyLarge),
              leading: TextButton.icon(
                icon: const Icon(
                  Icons.menu_book_rounded,
                ),
                onPressed: showMenu,
                label: Text('Další články', style: context.textTheme.bodyMedium),
              ),
              centerTitle: true,
            ),
            body: ListView.builder(
              itemCount: articleTopicList.length,
              itemBuilder: (BuildContext context, int index) {
                Article article = articleTopicList[index];
                return ArticleContainerWidget(article: article);
              },
            ),
          );
        },
      ),
    );
  }
}
