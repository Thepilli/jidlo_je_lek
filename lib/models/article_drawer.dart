import 'package:flutter/material.dart';

class DrawerItem {
  const DrawerItem({
    required this.icon,
    required this.title,
    required this.color,
  });

  final String title;
  final String icon;
  final Color color;
}

const drawerItems = [
  DrawerItem(
    // icon: Icons.medical_information,
    icon: 'assets/icons/article_navigation_close.png',
    title: '',
    color: Colors.transparent,
  ),
  DrawerItem(
    // icon: Icons.medical_information,
    icon: 'assets/icons/article_navigation_svepomoc.png',
    title: 'Svépomoc',
    color: Colors.transparent,
  ),
  DrawerItem(
    // icon: Icons.description_rounded,
    icon: 'assets/icons/article_navigation_cotoje.png',
    title: 'Co to je',
    color: Colors.transparent,
  ),
  DrawerItem(
    // icon: Icons.cloud,
    icon: 'assets/icons/article_navigation_treatment.png',
    title: 'Diagnóza a léčba',
    color: Colors.transparent,
  ),
  DrawerItem(
    // icon: Icons.wifi,
    icon: 'assets/icons/article_navigation_blog.png',
    title: 'Blog: Hladový deník',
    color: Colors.transparent,
  ),
  DrawerItem(
    // icon: Icons.favorite,
    icon: 'assets/icons/article_navigation_faq.png',
    title: 'FAQ',
    color: Colors.transparent,
  ),
  DrawerItem(
    // icon: Icons.network_cell,
    icon: 'assets/icons/article_navigation_back.png',
    title: 'Zpět',
    color: Colors.transparent,
  ),
];
