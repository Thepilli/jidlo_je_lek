import 'package:flutter/material.dart';
import 'package:flutter_ellipsis_text/flutter_ellipsis_text.dart';

import 'gallery_pop.dart';
import '../../utils/mytextstyles.dart';
import '../../widgets/html_readed_widget.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: TextButton(
        onPressed: () {},
        child: const EllipsisText(
          text:
              'O mně\nAhoj, Dobrý den. Jmenuji se Jiří a touto cestou bych rád pomohl všem, kteří se - stejně tak jako já - potýkají s nemocí zvanou mentální anorexie, nebo chtějí zjistit více o léčbě poruch příjmu potravy. Po zbytek času si budeme tykat, protože přece jenom je to intimnější téma, a navíc jsme v tom společně jako jedna komunita. Nejsi v tom sama, či sám! Ať už chceš využít jeden z nástrojů aplikace, nebo jen získat více informací jak postupovat s léčbou, věř že je to ten správný krok.\nPo začátku léčby jsem si uvědomil, jak malé, přehlížené, ba dokonce zkreslené, je povědomí o poruchách příjmu potravy a lidech jimi trpícími. A také že není jednoduché najít relevantní informace na jednom místě.',
          ellipsis: "..show more",
          maxLines: 1,
        ),
      ),
      body: ListView(
        children: [
          buildAppCard(
            'Aplikace Nepanikař',
            'assets/icons/help_nepanikar.png',
            'assets/htmls/1_LF_UK_a_VFN_oddeleni.html',
          ),
          buildCard(
            'Lůžkové specializované oddělení',
            'assets/icons/help_oddeleni.png',
            'assets/htmls/1_LF_UK_a_VFN_oddeleni.html',
          ),
          buildCard(
            'Denní stacionář',
            'assets/icons/help_stacionar.png',
            'assets/htmls/1_LF_UK_a_VFN_stacionar.html',
          ),
          buildCard(
            'Specializovaná ambulantní péče',
            'assets/icons/help_ambulance.png',
            'assets/htmls/1_LF_UK_a_VFN_ambulance.html',
          ),
          buildCard(
            'E-clinic',
            'assets/icons/help_e_clinic.png',
            'assets/htmls/e_clinic.html',
          ),
          buildCard(
            'Možnosti léčby',
            'assets/icons/help_lecba.png',
            'assets/htmls/help_lecba.html',
          ),
          buildCard(
            'Nasledky',
            'assets/icons/help_nasledky.png',
            'assets/htmls/nasledky.html',
          ),
        ],
      ),
    );
  }

  Widget buildCard(String title, String image, String htmlFilePath) => Padding(
      padding: const EdgeInsets.all(3.0),
      child: Card(
        child: ExpansionTile(
          leading: Image.asset(image, width: 50, height: 50),
          title: Text(title),
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: HtmlReaderWidget(htmlFilePath: htmlFilePath),
            ),
          ],
        ),
      ));

  Widget buildAppCard(String title, String image, String htmlFilePath) =>
      Padding(
        padding: const EdgeInsets.all(3.0),
        child: Card(
          child: ExpansionTile(
            leading: Image.asset(image, width: 50, height: 50),
            title: Text(title),
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Aplikace má sedm základních modulů: deprese, úzkost/panika, sebepoškozování, myšlenky na sebevraždu, sledování nálady, poruchy příjmu potravy a kontakty na odbornou pomoc.',
                        style: MyTextStyles.bodyText1,
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          InkwellPop(
                            imgPath: 'assets/images/nepanikar_app.png',
                          ),
                          InkwellPop(
                            imgPath: 'assets/images/nepanikar_qr.png',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

class InkwellPop extends StatelessWidget {
  final String imgPath;

  const InkwellPop({
    super.key,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GalleryPop(
              heroTag: imgPath,
            ),
          ),
        );
      },
      child: Hero(
        tag: imgPath,
        child: Image(
          image: AssetImage(imgPath),
          width: 150,
        ),
      ),
    );
  }
}
