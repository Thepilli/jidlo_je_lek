import 'package:flutter/material.dart';

import 'meal_plans.dart';

class Galery extends StatelessWidget {
  final String mealType;
  final dynamic mealContainerColor;
  final List<MealImage> immageAssets;

  const Galery(
      {super.key,
      required this.mealType,
      this.mealContainerColor,
      required this.immageAssets});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: immageAssets.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(immageAssets[index].mealImagePath),
              title: Text(immageAssets[index].mealImageDescription),
            ),
          );
        },
      ),
    );
  }
}
