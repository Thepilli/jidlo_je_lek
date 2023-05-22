import 'package:flutter/material.dart';
import 'package:stacionar_app/pages/article_navigationbar_page/article_navigation_page.dart';

class ApplicationGrid extends StatefulWidget {
  const ApplicationGrid({super.key});

  @override
  State<ApplicationGrid> createState() => _ApplicationGridState();
}

class _ApplicationGridState extends State<ApplicationGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Spacer(),
        GridView.count(
          crossAxisCount: 1,
          crossAxisSpacing: 0,
          scrollDirection: Axis.vertical,
          mainAxisSpacing: 0,
          shrinkWrap: true,
          childAspectRatio: 3,
          padding: const EdgeInsets.only(left: 24, right: 24),
          children: [
            itemTile(context, 'assets/icons/tab_icon_bmi.png', 'Kalkulačka bmi',
                'Výpočet BMI je velmi snadný, postačí ti k němu tovje váha a výška'),
            itemTile(
                context,
                'assets/icons/tab_icon_calendar.png',
                'Týdenní jídelníček',
                'Zajímá tě jaký jídelníček máme na tento týden?'),
            itemTile(
                context,
                'assets/icons/tab_icon_loterry.png',
                'Pečivová ruleta',
                'Nebaví tě lámat si hlavu si tím, jaké pečivo se dnes dáš?'),
            itemTile(
              context,
              'assets/icons/tab_icon_gallery.png',
              'Jídelní inspirace',
              'Nebo jen hledáš inspiraci co si naplánovat? Zkus se podívat do galerie',
            ),
          ],
        ),
        const Spacer(),
      ],
    ));
  }
}

Widget itemTile(
    BuildContext context, String iconPath, String title, String description) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
      tileColor: Colors.greenAccent.withOpacity(0.5),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ArticleNavigationPage()));
      },
      leading: SizedBox(
        width: 100,
        height: 100,
        child: Image.asset(iconPath),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Text(
          title,
        ),
      ),
      subtitle: Column(
        children: [
          Text(
            description,
          ),
        ],
      ),
    ),
  );
}
