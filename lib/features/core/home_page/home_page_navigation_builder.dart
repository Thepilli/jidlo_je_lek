import 'package:flutter/material.dart';

class HomePageNavigationBuilder extends StatelessWidget {
  final String iconPath;
  final String label;

  const HomePageNavigationBuilder({
    Key? key,
    required this.iconPath,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 80,
      child: SizedBox(
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 50,
              child: Image.asset(
                iconPath,
                width: 50,
                height: 50,
              ),
            ),
            Text(label, textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelSmall),
          ],
        ),
      ),
    );
  }
}
