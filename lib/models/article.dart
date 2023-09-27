class Article {
  final String title;
  final String image;
  final String bodyArticle;
  final int topicSection;
  final String topicName;

  Article({
    required this.title,
    required this.image,
    required this.bodyArticle,
    required this.topicSection,
    required this.topicName,
  });
}

List<Article> articles = [
  Article(
      title: "Kapitola 1.\nSledování jídelního režimu",
      image: "assets/images/chapter1.png",
      bodyArticle: "chapter_1.html",
      topicSection: 1,
      topicName: "Svépomocný program"),
  Article(
      title: "Kapitola 2.\nJídelní plán",
      image: "assets/images/chapter2.png",
      bodyArticle: "chapter_2.html",
      topicSection: 1,
      topicName: "Svépomocný program"),
  Article(
      title: "Kapitola 3.\nJak předcházet přejídání",
      image: "assets/images/chapter3.png",
      bodyArticle: "chapter_3.html",
      topicSection: 1,
      topicName: "Svépomocný program"),
  Article(
      title: "Kapitola 4.\nŘešení problémů",
      image: "assets/images/chapter4.png",
      bodyArticle: "chapter_4.html",
      topicSection: 1,
      topicName: "Svépomocný program"),
  Article(
      title: "Kapitola 5.\nOdstranění diet",
      image: "assets/images/chapter5.png",
      bodyArticle: "chapter_5.html",
      topicSection: 1,
      topicName: "Svépomocný program"),
  Article(
      title: "Co je anorexie?",
      image: "assets/images/co_je_anorexie.png",
      bodyArticle: "co_je_anorexie.html",
      topicSection: 2,
      topicName: "Co to je?"),
  Article(
      title: "Co jsou poruchy příjmu potravy?",
      image: "assets/images/co_je_ppp.png",
      bodyArticle: "co_je_ppp.html",
      topicSection: 2,
      topicName: "Co to je?"),
  Article(
      title: "Co je bulimie?",
      image: "assets/images/co_je_bulimie.png",
      bodyArticle: "co_je_bulimie.html",
      topicSection: 2,
      topicName: "Co to je?"),
  Article(
      title: "Co je záchvatovité přejídání?",
      image: "assets/images/co_je_prejidani.png",
      bodyArticle: "co_je_prejidani.html",
      topicSection: 2,
      topicName: "Co to je?"),
  Article(
      title: "Mentální anorexie: diagnóza a léčba",
      image: "assets/images/anorexie_lecba.png",
      bodyArticle: "anorexie_lecba.html",
      topicSection: 3,
      topicName: "Diagnóza a léčba"),
  Article(
      title: "Poruchy příjmu potravy: diagnóza a léčba",
      image: "assets/images/ppp_lecba.png",
      bodyArticle: "ppp_lecba.html",
      topicSection: 3,
      topicName: "Diagnóza a léčba"),
  Article(
      title: "Bulimie: diagnóza a léčba",
      image: "assets/images/bulimie_lecba.png",
      bodyArticle: "bulimie_lecba.html",
      topicSection: 3,
      topicName: "Diagnóza a léčba"),
  Article(
      title: "Záchvatovité přejídání: diagnóza a léčba",
      image: "assets/images/prejidani_lecba.png",
      bodyArticle: "prejidani_lecba.html",
      topicSection: 3,
      topicName: "Diagnóza a léčba"),
  Article(
      title: "1. Úvodem",
      image: "assets/images/hladovy_denik.png",
      bodyArticle: "hladovy_denik/0_hladovy_denik_uvodem.html",
      topicSection: 4,
      topicName: "Hladový deník"),
  Article(
      title: "2. O mně",
      image: "assets/images/hladovy_denik.png",
      bodyArticle: "hladovy_denik/1_hladovy_denik_o_mne.html",
      topicSection: 4,
      topicName: "Hladový deník"),
  Article(
      title: "3. Můj pohled na anorexii",
      image: "assets/images/hladovy_denik.png",
      bodyArticle: "hladovy_denik/2_hladovy_denik_muj_pohled_na_anorexii.html",
      topicSection: 4,
      topicName: "Hladový deník"),
  Article(
      title: "4. Zmatení",
      image: "assets/images/hladovy_denik.png",
      bodyArticle: "hladovy_denik/3_hladovy_denik_zmateni.html",
      topicSection: 4,
      topicName: "Hladový deník"),
  Article(
      title: "5. Čistota",
      image: "assets/images/hladovy_denik.png",
      bodyArticle: "hladovy_denik/4_hladovy_denik_cistota.html",
      topicSection: 4,
      topicName: "Hladový deník"),
  Article(
      title: "6. Rychlokurz anorektického myšlení",
      image: "assets/images/hladovy_denik.png",
      bodyArticle: "hladovy_denik/5_hladovy_denik_rychlokurz_anorektickeho_mysleni.html",
      topicSection: 4,
      topicName: "Hladový deník"),
  Article(
      title: "7. Trocha vánočního sentimentu",
      image: "assets/images/hladovy_denik.png",
      bodyArticle: "hladovy_denik/6_hladovy_denik_trocha_vanocniho_sentimentu.html",
      topicSection: 4,
      topicName: "Hladový deník"),
  Article(
      title: "8. Idylka",
      image: "assets/images/hladovy_denik.png",
      bodyArticle: "hladovy_denik/7_hladovy_denik_idylka.html",
      topicSection: 4,
      topicName: "Hladový deník"),
  Article(
      title: "9. Dobré zprávy!",
      image: "assets/images/hladovy_denik.png",
      bodyArticle: "hladovy_denik/8_hladovy_denik_dobre_zpravy.html",
      topicSection: 4,
      topicName: "Hladový deník"),
  Article(
      title: "10. Co mi momentálně dělá radost",
      image: "assets/images/hladovy_denik.png",
      bodyArticle: "hladovy_denik/9_hladovy_denik_co_mi_momentalne_dela_radost.html",
      topicSection: 4,
      topicName: "Hladový deník"),
  Article(
      title: "11. Výroba vína",
      image: "assets/images/hladovy_denik.png",
      bodyArticle: "hladovy_denik/10_hladovy_denik_vyroba_vina.html",
      topicSection: 4,
      topicName: "Hladový deník"),
  Article(
      title: "12. Nic moc se neděje",
      image: "assets/images/hladovy_denik.png",
      bodyArticle: "hladovy_denik/11_hladovy_denik_nic_moc_se_nedeje.html",
      topicSection: 4,
      topicName: "Hladový deník"),
  Article(
      title: "13. Teď čtu...",
      image: "assets/images/hladovy_denik.png",
      bodyArticle: "hladovy_denik/12_hladovy_denik_ted_ctu.html",
      topicSection: 4,
      topicName: "Hladový deník"),
  Article(
      title: "14. Ha!",
      image: "assets/images/hladovy_denik.png",
      bodyArticle: "hladovy_denik/13_hladovy_denik_ha.html",
      topicSection: 4,
      topicName: "Hladový deník")
];
