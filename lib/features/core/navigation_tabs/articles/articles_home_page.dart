import 'package:flutter/material.dart';
import 'package:stacionar_app/app/app_constants.dart';
import 'package:stacionar_app/features/core/navigation_tabs/articles/articles_navigation/widgets/article_list_page.dart';
import 'package:stacionar_app/shared/extensions/build_context.dart';
import 'package:stacionar_app/shared/widgets/disclaimer_text_widget.dart';

class ArticlesHomePage extends StatelessWidget {
  const ArticlesHomePage({super.key});
  final String title = 'Poruchy příjmu potravy';
  final String descriptionTwo =
      'Další sekce obsahují malé aplikace pro usnadnění boje s těmito zákeřnými nemocemi, jako je kalkulačka BMI, ukázkové jídelníčky při léčbě, "pečivovou" ruletu, a další užitečné informace';
  final String descriptionOne =
      'Zde najdete základní informace o tom, co jsou to poruchy příjmu potravy – mentální anorexie, bulimie a záchvatovité přejídání, jak je u sebe či u ostatních poznáme a co můžeme v případě zjištění nemoci dělat';
  final String disclaimer =
      'Prosím berte na vědomí, že zdravotní, výživová či léčebná tvrzení jsou v rámci legislativy EU výrazně omezena. Při tvorbě článků smíme vycházet pouze ze schválených tvrzení, která uvádí platná legislativa.';
  final String aboutAuhor =
      'Články prezentované v této aplikaci slouží pouze jako konsolidované informace a nejsou autorským dílem tvůrce aplikace';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 5),
              const ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
                child: Image(
                  image: AssetImage('assets/images/dictionary_header.png'),
                  width: 250,
                ),
              ),
              const SizedBox(height: jButtonHeight),
              Text(title, style: context.textTheme.bodyLarge),
              const SizedBox(height: jButtonHeight),
              Text(descriptionOne, style: context.textTheme.bodyMedium),
              const SizedBox(height: jButtonHeight),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, jButtonHeight),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ArticleListPage(),
                    ),
                  );
                },
                child: Text(
                  'Podívat se na články',
                  style: context.textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: jButtonHeight),
              Text(descriptionTwo, style: context.textTheme.bodyMedium),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: context.primary,
        onPressed: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            backgroundColor: context.primary,
            context: context,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                  child: Column(
                    children: [DisclaimerText(disclaimer: aboutAuhor), DisclaimerText(disclaimer: disclaimer)],
                  ),
                ),
              );
            },
          );
        },
        label: Text(
          'Upozornění',
          style: context.textTheme.bodyMedium,
        ),
        icon: const Icon(Icons.info),
      ),
    );
  }
}
