import 'package:flutter/material.dart';

import '../../model/meal_plans.dart';
import 'components/meal_type_detail_container.dart';

class MealPlanDetail extends StatelessWidget {
  final String mealType;
  final dynamic mealPlanColor;
  final List<MealImage> imageAssets;

  const MealPlanDetail({
    super.key,
    required this.mealType,
    this.mealPlanColor,
    required this.imageAssets,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mealPlanColor.withAlpha(80),
        title: Text(mealType),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: imageAssets.length,
          itemBuilder: (BuildContext context, int index) {
            MealImage mealImage = imageAssets[index];

            return MealPlanDetailContainer(
              mealImagePath: mealImage.mealImagePath,
              mealImageDescription: mealImage.mealImageDescription,
              mealPlanColor: mealPlanColor,
            );
          },
        ),
      ),
    );
  }
}
