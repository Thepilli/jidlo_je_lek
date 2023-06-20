import 'package:flutter/material.dart';
import 'package:stacionar_app/constants/sizes.dart';

class MealTypeContainer extends StatelessWidget {
  final String mealType;
  final dynamic mealPlanColor;
  final String mealIconPath;
  final String mealTime;

  const MealTypeContainer({
    Key? key,
    required this.mealType,
    required this.mealPlanColor,
    required this.mealIconPath,
    required this.mealTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 170,
        decoration: BoxDecoration(
          border: Border.all(color: mealPlanColor[100], width: 4),
          color: mealPlanColor[50],
          borderRadius: BorderRadius.circular(jBorderRadius),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // mealTime
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: mealPlanColor[100],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(jBorderRadius),
                      topRight: Radius.circular(jBorderRadius - 10),
                    ),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Text(mealTime, style: Theme.of(context).textTheme.labelLarge),
                ),
              ],
            ),

            // mealIcon
            Image.asset(mealIconPath, height: 80),

            // mealType
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(mealType, textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelLarge),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
