import 'package:flutter/material.dart';

class MenuValues {
  const MenuValues({
    required this.icon,
    required this.title,
    required this.items,
    required this.color,
  });

  final String title;
  final String icon;
  final Color color;
  final List<MenuValues> items;
}

const myMenuValue = [
  MenuValues(
    // icon: Icons.close,
    icon: 'assets/icons/article_navigation_close.png',
    title: '',
    items: [],
    color: Colors.transparent,
  ),
  MenuValues(
    // icon: Icons.medical_information,
    icon: 'assets/icons/article_navigation_svepomoc.png',
    title: 'Svépomoc',
    items: [],
    color: Colors.transparent,
  ),
  MenuValues(
    // icon: Icons.description_rounded,
    icon: 'assets/icons/article_navigation_cotoje.png',
    title: 'Co to je',
    items: [],
    color: Colors.transparent,
  ),
  MenuValues(
    // icon: Icons.cloud,
    icon: 'assets/icons/article_navigation_treatment.png',
    title: 'Diagnóza a léčba',
    items: [],
    color: Colors.transparent,
  ),
  MenuValues(
    // icon: Icons.wifi,
    icon: 'assets/icons/article_navigation_blog.png',
    title: 'Blog: Hladový deník',
    items: [],
    color: Colors.transparent,
  ),
  MenuValues(
    // icon: Icons.favorite,
    icon: 'assets/icons/article_navigation_faq.png',
    title: 'FAQ',
    items: [],
    color: Colors.transparent,
  ),
  MenuValues(
    // icon: Icons.network_cell,
    icon: 'assets/icons/article_navigation_back.png',
    title: 'Zpět',
    items: [],
    color: Colors.transparent,
  ),
];
