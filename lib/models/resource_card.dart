class ResourceCard {
  final String title;
  final String imagePath;
  final String sourcePath;
  final List<String>? extraImages;

  ResourceCard({
    required this.title,
    required this.imagePath,
    required this.sourcePath,
    this.extraImages,
  });
}

List<ResourceCard> resources = [
  ResourceCard(
    title: 'Lůžkové specializované oddělení',
    imagePath: 'assets/icons/help_oddeleni.png',
    sourcePath: 'assets/htmls/1_LF_UK_a_VFN_oddeleni.html',
  ),
  ResourceCard(
    title: 'Denní stacionář',
    imagePath: 'assets/icons/help_stacionar.png',
    sourcePath: 'assets/htmls/1_LF_UK_a_VFN_stacionar.html',
  ),
  ResourceCard(
    title: 'Specializovaná ambulantní péče',
    imagePath: 'assets/icons/help_ambulance.png',
    sourcePath: 'assets/htmls/1_LF_UK_a_VFN_ambulance.html',
  ),
  ResourceCard(
    title: 'E-clinic',
    imagePath: 'assets/icons/help_e_clinic.png',
    sourcePath: 'assets/htmls/e_clinic.html',
  ),
  ResourceCard(
    title: 'Možnosti léčby',
    imagePath: 'assets/icons/help_lecba.png',
    sourcePath: 'assets/htmls/help_lecba.html',
  ),
  ResourceCard(
    title: 'Následky',
    imagePath: 'assets/icons/help_nasledky.png',
    sourcePath: 'assets/htmls/nasledky.html',
  ),
  ResourceCard(
      title: 'Aplikace Nepanikař',
      imagePath: 'assets/icons/help_nepanikar.png',
      sourcePath: 'assets/htmls/nepanikar.html',
      extraImages: ['assets/images/nepanikar_app.png', 'assets/images/nepanikar_qr.png'])
];
