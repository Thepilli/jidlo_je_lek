import 'package:flutter/material.dart';

class TabPageBuilder extends StatelessWidget {
  final String iconPath;
  final String label;

  const TabPageBuilder(
      {super.key, required this.iconPath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 80,
      child: Container(
        padding: const EdgeInsets.all(1),
        child: Image.asset(
          iconPath,
        ),
      ),
    );
  }
}
