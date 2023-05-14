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
        child: Column(
          children: [
            const SizedBox(height: 5),
            SizedBox(
              child: Image.asset(
                iconPath,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
