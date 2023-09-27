import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacionar_app/models/meal_plans.dart';
import 'package:stacionar_app/router/app_router.dart';
import 'package:stacionar_app/shared/extensions/build_context.dart';
import 'package:stacionar_app/shared/widgets/contrained_container.dart';

class MealPlanDetail extends StatelessWidget {
  final Meal meal;

  const MealPlanDetail({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: meal.mealPlanColor.withAlpha(80),
        title: Text(meal.mealType, style: context.textTheme.bodyLarge),
      ),
      body: ConstrainedContainer(
        child: SafeArea(
          child: ListView.builder(
            itemCount: meal.mealImageAssets.length,
            itemBuilder: (BuildContext context, int index) {
              MealImage mealImage = meal.mealImageAssets[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                width: context.sizeWidth,
                height: context.sizeHeight * .15,
                decoration: BoxDecoration(
                  border: Border.all(color: meal.mealPlanColor.withOpacity(.3), width: 4),
                  color: meal.mealPlanColor.withOpacity(.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: mealImage.mealImagePath,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: GestureDetector(
                            onTap: () => context.pushNamed(Routes.galleryPop.name, extra: mealImage.mealImagePath.toString()),
                            child: Image.asset(mealImage.mealImagePath)),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        mealImage.mealImageDescription,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
