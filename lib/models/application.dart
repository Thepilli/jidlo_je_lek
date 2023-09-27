class Application {
  final String title;
  final String description;
  final String imagePath;
  final String route;

  Application({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.route,
  });
}

List<Application> applicationList = [
  Application(
    title: 'Kalkulačka BMI',
    description: 'Výpočet BMI je velmi snadný, postačí ti k němu tovje váha a výška',
    imagePath: 'assets/icons/tab_icon_bmi.png',
    route: '/BmiCalculator',
  ),
  Application(
    title: 'Týdenní jídelníček',
    description: 'Zajímá tě jaký jídelníček máme na tento týden?',
    imagePath: 'assets/icons/tab_icon_calendar.png',
    route: '/StacionarMenu',
  ),
  Application(
    title: 'Pečivová ruleta',
    description: 'Nebaví tě lámat si hlavu tím, jaké pečivo se dnes dáš?',
    imagePath: 'assets/icons/tab_icon_loterry.png',
    route: '/FortuneWheelPage',
  ),
  Application(
    title: 'Jídelní inspirace',
    description: 'Nebo jen hledáš inspiraci co si naplánovat? Zkus se podívat do galerie',
    imagePath: 'assets/icons/tab_icon_gallery.png',
    route: '/MealInspiration',
  ),
  Application(
    title: 'Relaxační nahrávky',
    description: 'Potřebuješ se uklidnit? Zkus si pustit některou z našich relaxačních nahrávek',
    imagePath: 'assets/icons/tab_icon_relaxation.png',
    route: '/RelaxationList',
  ),
  Application(
    title: 'Příběhy Pušínka',
    description: 'Máš chvilu a potřebuješ se odreagovat? Zkus si pustit některý z příběhů Pušínka',
    imagePath: 'assets/icons/tab_icon_pusheen.png',
    route: '/VideoList',
  ),
];
