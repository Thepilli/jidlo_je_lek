import 'package:flutter/material.dart';

class TabPageBuilder extends StatelessWidget {
  final String iconPath;

  const TabPageBuilder({super.key, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 80,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Image.asset(
          iconPath,
        ),
      ),
    );
  }
}