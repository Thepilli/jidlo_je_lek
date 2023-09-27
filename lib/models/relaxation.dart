class Relaxation {
  const Relaxation({
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

List<Relaxation> relaxationList = [
  const Relaxation(
    relaxationType: 'afirmace_ranni',
    title: 'Ranní',
    tileTitle: 'Ranní Afirmace',
    asset: 'assets/audio/afirmace_ranni.mp3',
    tileAsset: 'assets/images/tile_afirmace.png',
    description:
        'Nastartuj svůj den, pomocí této afirmace, která ti pomůže udržet celý den pozornost na tom, co je důležité. Tvoje přání se budou plnit lusknutím prstu.',
    background: 'assets/audio/afirmace.png',
  ),
  const Relaxation(
    relaxationType: 'afirmace_zdravi',
    title: 'Pro zdraví',
    tileTitle: 'Afirmace pro zdraví',
    asset: 'assets/audio/afirmace_zdravi.mp3',
    tileAsset: 'assets/images/tile_afirmace.png',
    description:
        'Tato afirmace pro zdraví je sestavena tak, aby započala proces léčení a uzdravení. Obsahuje práci s myslí, s potřebou vytvářet a držet si nemoc, a jde tak hlouběji k problému, nikoli jen po jeho povrchu',
    background: 'assets/audio/afirmace.png',
  ),
  const Relaxation(
    relaxationType: 'ambience_cafe',
    title: 'Prostředí kavárny',
    tileTitle: 'Prostředí kavárny',
    asset: 'assets/audio/ambience_cafe.mp3',
    tileAsset: 'assets/images/tile_ambience.png',
    description:
        'Nahrávka zachycuje atmosféru a prostředí kavárny a při jejím poslechu se ocitnete v prostředí plném příjemných zvuků a vůní, které jsou typické pro kavárnu.',
    background: 'assets/audio/ambience.png',
  ),
  const Relaxation(
    relaxationType: 'ambience_forest',
    title: 'Zvuky lesa',
    tileTitle: 'Zvuky lesa',
    asset: 'assets/audio/ambience_forest.mp3',
    tileAsset: 'assets/images/tile_ambience.png',
    description:
        'Nahrávka zachycuje atmosféru a zvuky přírody v lese. Při poslechu této nahrávky se ocitnete v prostředí, kde slyšíte šumění stromů, ptačí zpěv, šustění listí pod nohama a občasné zvuky vzdálených zvířat. Cítíte příjemnou vůni lesa a vnímáte klidnou a uvolněnou atmosféru.',
    background: 'assets/audio/ambience.png',
  ),
  const Relaxation(
    relaxationType: 'ambience_ocean',
    title: 'Zvuky oceánu',
    tileTitle: 'Zvuky oceánu',
    asset: 'assets/audio/ambience_ocean.mp3',
    tileAsset: 'assets/images/tile_ambience.png',
    description:
        'Nahrávka zachycuje atmosféru a zvuky oceánu, a přenese vás do prostředí plného šumění vln, které se valí na pláž. Při poslechu této nahrávky můžete slyšet relaxační zvuky mořského větru, bublání vody',
    background: 'assets/audio/ambience.png',
  ),
  const Relaxation(
    relaxationType: 'ambience_storm',
    title: 'Zvuky deště',
    tileTitle: 'Zvuky deště',
    asset: 'assets/audio/ambience_storm.mp3',
    tileAsset: 'assets/images/tile_ambience.png',
    description:
        'Nahrávka zachycuje atmosféru příjemného a klidného prostředí deště. Při poslechu této nahrávky můžete slyšet jemné kapky deště dopadající na střechu, šplouchání vody v kalužích a občasné hromy',
    background: 'assets/audio/ambience.png',
  ),
  const Relaxation(
    relaxationType: 'meditace_podvedomi',
    title: 'Podvědomí',
    tileTitle: 'Meditace pro podvědomí',
    asset: 'assets/audio/meditace_podvedomi.mp3',
    tileAsset: 'assets/images/tile_meditace.png',
    description:
        'Komunikace s podvědomím není nemožná. Naučte se komunikovat s podvědomím a dostaňte odpovědi a řešení na všechny vaše otázky a problémy. Tato velmi účinná meditace a sugesce vám pomůže.',
    background: 'assets/audio/meditace.png',
  ),
  const Relaxation(
    relaxationType: 'meditace_prani',
    title: 'Přání',
    tileTitle: 'Meditace pro přání',
    asset: 'assets/audio/meditace_prani.mp3',
    tileAsset: 'assets/images/tile_meditace.png',
    description:
        'Tato vizualizace s prvky meditace pomáhá k nastavení mysli na získání toho, co v životě chceme. Imaginace s relakcací a uvolněním má jedny z největších a nejvýznamnějších účinků a vlivů na to, co si přejeme i na manifestaci.',
    background: 'assets/audio/meditace.png',
  ),
  const Relaxation(
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
