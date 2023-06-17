import 'package:flutter/material.dart';
import 'package:stacionar_app/pages/article_navigationbar_page/article_navigation_page.dart';
import 'package:stacionar_app/utils/mytextstyles.dart';

import '../../widgets/disclaimer_text_widget.dart';

class DictionaryPage extends StatelessWidget {
  const DictionaryPage({super.key});
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
    return Scaffold(
      body: SingleChildScrollView(
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
            Text(title, style: MyTextStyles.headline1),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(description, style: MyTextStyles.bodyText1),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ArticleNavigationPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                foregroundColor: Colors.black,
                shape: const StadiumBorder(),
              ),
              child: const Text(
                'Podívat se na články',
                style: MyTextStyles.headline3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(features, style: MyTextStyles.bodyText1),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        splashColor: Colors.greenAccent,
        onPressed: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            backgroundColor: const Color.fromRGBO(244, 233, 215, 1),
            context: context,
            builder: (context) {
              return SizedBox(
                height: 200,
                child: Column(
                  children: [
                    disclaimerText(autor),
                    disclaimerText(disclaimer),
                  ],
                ),
              );
            },
          );
        },
        label: const Text('Upozornění'),
        icon: const Icon(Icons.info),
      ),
    );
  }
}
