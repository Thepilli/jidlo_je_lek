import 'package:flutter/material.dart';
import 'package:stacionar_app/features/core/navigation_tabs/meal_plan/components/meal_type_container.dart';
import 'package:stacionar_app/features/core/navigation_tabs/meal_plan/meal_plan_detail.dart';
import 'package:stacionar_app/model/meal_plans.dart';

// ignore: must_be_immutable
class MealPlanScreen extends StatelessWidget {
  final List<Meal> mealList;

  const MealPlanScreen({super.key, required this.mealList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Toto jsou ukázkové jídelníčky, včetně časů kdy dané chody jíst.',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: mealList.length,
                itemBuilder: (BuildContext context, int index) {
                  Meal meal = mealList[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MealPlanDetail(
                            mealType: meal.mealType,
                            mealPlanColor: meal.mealPlanColor,
                            imageAssets: meal.mealImageAssets,
                          ),
                        ),
                      );
                    },
                    child: MealTypeContainer(
                      mealType: meal.mealType,
                      mealIconPath: meal.mealIconPath,
                      mealTime: meal.mealTime,
                      mealPlanColor: meal.mealPlanColor,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
