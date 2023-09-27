import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacionar_app/models/meal_plans.dart';
import 'package:stacionar_app/router/app_router.dart';
import 'package:stacionar_app/shared/extensions/build_context.dart';
import 'package:stacionar_app/shared/widgets/jbox.dart';

class MealPlanPage extends StatelessWidget {
  const MealPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Meal> plans = mealList;
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Toto jsou ukázkové jídelníčky, včetně časů kdy dané chody jíst.',
              style: context.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: plans.length,
              itemBuilder: (BuildContext context, int index) {
                Meal meal = plans[index];

                return GestureDetector(
                  onTap: () {
                    context.pushNamed(Routes.mealPlanDetail.name, extra: meal);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                    width: context.sizeWidth,
                    height: context.sizeHeight * .2,
                    decoration: BoxDecoration(
                      border: Border.all(color: meal.mealPlanColor.withOpacity(.3), width: 4),
                      color: meal.mealPlanColor.withOpacity(.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                            decoration: BoxDecoration(
                              color: meal.mealPlanColor.withOpacity(.3),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                topRight: Radius.circular(15),
                              ),
                            ),
                            child: Text(meal.mealTime, style: context.textTheme.bodyMedium),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(meal.mealIconPath, height: 80),
                            const JBox(height: 10),
                            Text(meal.mealType, style: context.textTheme.bodyMedium),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
