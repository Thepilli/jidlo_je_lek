import 'package:flutter/material.dart';
import 'package:stacionar_app/features/core/navigation_tabs/meal_plan/components/meal_type_detail_container.dart';
import 'package:stacionar_app/model/meal_plans.dart';
import 'package:stacionar_app/widgets/contrained_container.dart';

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
        titleSpacing: 0,
        centerTitle: true,
        backgroundColor: mealPlanColor.withAlpha(80),
        title: Text(mealType, style: Theme.of(context).textTheme.headlineLarge),
      ),
      body: ConstrainedContainer(
        child: SafeArea(
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
      ),
    );
  }
}
