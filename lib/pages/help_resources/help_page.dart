import 'package:flutter/material.dart';

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
