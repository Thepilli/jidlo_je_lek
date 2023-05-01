import 'package:flutter/material.dart';

class MenuValues {
  const MenuValues({
    required this.icon,
    required this.title,
    required this.items,
    required this.color,
  });

  final String title;
  final IconData icon;
  final Color color;
  final List<MenuValues> items;
}

const myMenuValue = [
  MenuValues(
      icon: Icons.close, items: [], color: Colors.transparent, title: ''),
  MenuValues(
    icon: Icons.music_note_rounded,
    title: 'Music',
    items: [],
    color: Colors.transparent,
  ),
  MenuValues(
    icon: Icons.phone_bluetooth_speaker_rounded,
    title: 'Calls',
    items: [],
    color: Colors.transparent,
  ),
  MenuValues(
    icon: Icons.cloud,
    title: 'Cloud',
    items: [],
    color: Colors.transparent,
  ),
  MenuValues(
    icon: Icons.wifi,
    title: 'Wifi',
    items: [],
    color: Colors.transparent,
  ),
  MenuValues(
    icon: Icons.favorite,
    title: 'Favorites',
    items: [],
    color: Colors.transparent,
  ),
  MenuValues(
    icon: Icons.network_cell,
    title: 'Networks',
    items: [],
    color: Colors.transparent,
  ),
];
