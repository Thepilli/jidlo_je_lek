import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacionar_app/constants/colors.dart';
import 'package:stacionar_app/features/core/navigation_tabs/applications_list/applications/relaxation/relaxation_screen.dart';

class RelaxationTypes {
  const RelaxationTypes({
    required this.relaxationType,
    required this.title,
    required this.tileTitle,
    required this.asset,
    required this.tileAsset,
    required this.description,
    required this.background,
  });

  final String relaxationType;
  final String title;
  final String tileTitle;
  final String asset;
  final String tileAsset;
  final String description;
  final String background;
}

List relaxationType = [
  const RelaxationTypes(
    relaxationType: 'afirmace_ranni',
    title: 'Ranní',
    tileTitle: 'Ranní Afirmace',
    asset: 'assets/audio/afirmace_ranni.mp3',
    tileAsset: 'assets/images/tile_afirmace.png',
    description:
        'Nastartuj svůj den, tyto ranní afirmace ti pomůžou nakopnout tvůj den. Tyto afirmace ti pomohou udržet celý den pozornost na tom, co je důležité a také - díky těmto afirmacím zažiješ zázraky doslova na počkání. Tvoje přání se budou plnit lusknutím prstu.',
    background: 'assets/audio/afirmace.png',
  ),
  const RelaxationTypes(
    relaxationType: 'afirmace_zdravi',
    title: 'Pro zdraví',
    tileTitle: 'Afirmace pro zdraví',
    asset: 'assets/audio/afirmace_zdravi.mp3',
    tileAsset: 'assets/images/tile_afirmace.png',
    description:
        'Tyto afirmace zdraví jsou sestaveny tak, aby započaly proces léčení a uzdravení. Zároveň tyto afirmace zdraví obsahují i práci s myslí, s potřebou vytvářet a držet si nemoc. Proto jsou tyto afirmace zdraví tak účinné, jdou hlouběji k problému, nikoli jen po jeho povrchu',
    background: 'assets/audio/afirmace.png',
  ),
  const RelaxationTypes(
    relaxationType: 'ambience_cafe',
    title: 'Prostředí kavárny',
    tileTitle: 'Prostředí kavárny',
    asset: 'assets/audio/ambience_cafe.mp3',
    tileAsset: 'assets/images/tile_ambience.png',
    description:
        'Nahrávka zachycuje atmosféru a prostředí kavárny a při jejím poslechu se ocitnete v prostředí plném příjemných zvuků a vůní, které jsou typické pro kavárnu.',
    background: 'assets/audio/ambience.png',
  ),
  const RelaxationTypes(
    relaxationType: 'ambience_forest',
    title: 'Zvuky lesa',
    tileTitle: 'Zvuky lesa',
    asset: 'assets/audio/ambience_forest.mp3',
    tileAsset: 'assets/images/tile_ambience.png',
    description:
        'Nahrávka zachycuje atmosféru a zvuky přírody v lese. Při poslechu této nahrávky se ocitnete v prostředí, kde slyšíte šumění stromů, ptačí zpěv, šustění listí pod nohama a občasné zvuky vzdálených zvířat. Cítíte příjemnou vůni lesa a vnímáte klidnou a uvolněnou atmosféru.',
    background: 'assets/audio/ambience.png',
  ),
  const RelaxationTypes(
    relaxationType: 'ambience_ocean',
    title: 'Zvuky oceánu',
    tileTitle: 'Zvuky oceánu',
    asset: 'assets/audio/ambience_ocean.mp3',
    tileAsset: 'assets/images/tile_ambience.png',
    description:
        'Nahrávka zachycuje atmosféru a zvuky oceánu, a přenese vás do prostředí plného šumění vln, které se valí na pláž. Při poslechu této nahrávky můžete slyšet relaxační zvuky mořského větru, bublání vody',
    background: 'assets/audio/ambience.png',
  ),
  const RelaxationTypes(
    relaxationType: 'ambience_storm',
    title: 'Zvuky deště',
    tileTitle: 'Zvuky deště',
    asset: 'assets/audio/ambience_storm.mp3',
    tileAsset: 'assets/images/tile_ambience.png',
    description:
        'Nahrávka zachycuje atmosféru příjemného a klidného prostředí deště. Při poslechu této nahrávky můžete slyšet jemné kapky deště dopadající na střechu, šplouchání vody v kalužích a občasné hromy',
    background: 'assets/audio/ambience.png',
  ),
  const RelaxationTypes(
    relaxationType: 'meditace_podvedomi',
    title: 'Podvědomí',
    tileTitle: 'Meditace pro podvědomí',
    asset: 'assets/audio/meditace_podvedomi.mp3',
    tileAsset: 'assets/images/tile_meditace.png',
    description:
        'Komunikace s podvědomím není nemožná. Naučte se komunikovat s podvědomím a dostaňte odpovědi a řešení na všechny vaše otázky a problémy. Tato velmi účinná meditace a sugesce vám pomůže.',
    background: 'assets/audio/meditace.png',
  ),
  const RelaxationTypes(
    relaxationType: 'meditace_prani',
    title: 'Přání',
    tileTitle: 'Meditace pro přání',
    asset: 'assets/audio/meditace_prani.mp3',
    tileAsset: 'assets/images/tile_meditace.png',
    description:
        'Tato vizualizace s prvky meditace pomáhá k nastavení mysli na získání toho, co v životě chceme. Imaginace s relakcací a uvolněním má jedny z největších a nejvýznamnějších účinků a vlivů na to, co si přejeme i na manifestaci.',
    background: 'assets/audio/meditace.png',
  ),
  const RelaxationTypes(
    relaxationType: 'meditace_vecerni',
    title: 'Večerní',
    tileTitle: 'Večerní meditace',
    asset: 'assets/audio/meditace_vecerni.mp3',
    tileAsset: 'assets/images/tile_meditace.png',
    description:
        'Tato nádherná meditace před spaním vám pomůže nalézt klid, nechat jít všechny události dne a pomůže připravit se na nadcházející ráno. Meditace před spaním je úžasná věc na zklidnění mysli, duše i těla.',
    background: 'assets/audio/meditace.png',
  ),
];

class RelaxationList extends StatelessWidget {
  const RelaxationList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var isDark = Get.isDarkMode;
    var iconColor = isDark ? jPrimaryDarkColor : jPrimaryLightColor;
    var containerBorderColor = isDark ? jPrimaryDarkContainerColor : jPrimaryLightContainerColor;
    var scaffoldColor = isDark ? jScafoldDarkColor : jScafoldLightColor;
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: iconColor),
          elevation: 0,
          centerTitle: true,
          backgroundColor: scaffoldColor,
          title: Text(
            "Relaxační nahrávky",
            style: Theme.of(context).textTheme.displayLarge,
          )),
      body: SafeArea(
        child: Column(children: [
          Container(
            decoration: BoxDecoration(color: scaffoldColor),
            padding: const EdgeInsets.all(8),
            child: Text(
              'Vyber si relaxaci která ti nejvíce vyhovuje.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.builder(
                itemCount: relaxationType.length,
                itemBuilder: (context, index) {
                  RelaxationTypes relaxation = relaxationType[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: containerBorderColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: iconColor,
                      ),
                      child: ListTile(
                        title: Text(relaxation.tileTitle),
                        leading: Image.asset(relaxation.tileAsset),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RelaxationScreen(
                                relaxationType: relaxation.relaxationType,
                                title: relaxation.title,
                                tileTitle: relaxation.title,
                                track: relaxation.title,
                                description: relaxation.title,
                                tileAsset: relaxation.title,
                                background: relaxation.title,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
