import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacionar_app/constants/colors.dart';
import 'package:stacionar_app/constants/sizes.dart';
import 'package:stacionar_app/features/core/home_page/navigation_tabs/articles/articles_navigation/article_navigation_page.dart';
import 'package:stacionar_app/widgets/disclaimer_text_widget.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});
  final String title = 'Poruchy příjmu potravy';
  final String features =
      'Další sekce obsahují malé aplikace pro usnadnění boje s těmito zákeřnými nemocemi, jako je kalkulačka BMI, ukázkové jídelníčky při léčbě, "pečivovou" ruletu, a další užitečné informace';
  final String description =
      'Zde najdete základní informace o tom, co jsou to poruchy příjmu potravy – mentální anorexie, bulimie a záchvatovité přejídání, jak je u sebe či u ostatních poznáme a co můžeme v případě zjištění nemoci dělat';
  final String disclaimer =
      'Prosím berte na vědomí, že zdravotní, výživová či léčebná tvrzení jsou v rámci legislativy EU výrazně omezena. Při tvorbě článků smíme vycházet pouze ze schválených tvrzení, která uvádí platná legislativa.';
  final String autor =
      'Články prezentované v této aplikaci slouží pouze jako konsolidované informace a nejsou autorským dílem tvůrce aplikace';

  @override
  Widget build(BuildContext context) {
    var isDark = Get.isDarkMode;
    var modalColor = isDark ? jPrimaryDarkContainerColor : jPrimaryLightContainerColor;
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
                  width: 300,
                ),
              ),
              const SizedBox(height: jButtonHeight),
              Text(title, style: Theme.of(context).textTheme.displayMedium),
              const SizedBox(height: jButtonHeight),
              Text(description, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: jButtonHeight),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, jButtonHeight),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ArticleNavigationPage()));
                },
                child: const Text(
                  'Podívat se na články',
                ),
              ),
              const SizedBox(height: jButtonHeight),
              Text(features, style: Theme.of(context).textTheme.headlineMedium),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                        ),
                        backgroundColor: modalColor,
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: 200,
                            child: Column(
                              children: [
                                DisclaimerText(disclaimer: autor + disclaimer),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: const Text('Upozornění'),
                    // icon: const Icon(Icons.info),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     showModalBottomSheet(
      //       shape: const RoundedRectangleBorder(
      //         borderRadius: BorderRadius.only(
      //           topLeft: Radius.circular(30.0),
      //           topRight: Radius.circular(30.0),
      //         ),
      //       ),
      //       backgroundColor: modalColor,
      //       context: context,
      //       builder: (context) {
      //         return SizedBox(
      //           height: 200,
      //           child: Column(
      //             children: [
      //               DisclaimerText(disclaimer: autor + disclaimer),
      //             ],
      //           ),
      //         );
      //       },
      //     );
      //   },
      //   label: const Text('Upozornění'),
      //   icon: const Icon(Icons.info),
      // ),
    );
  }
}
