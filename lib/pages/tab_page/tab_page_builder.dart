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
      child: SizedBox(
        width: 50,
        child: Column(
          children: [
            SizedBox(
              width: 50,
              child: Image.asset(
                iconPath,
                width: 50,
                height: 50,
              ),
            ),
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
