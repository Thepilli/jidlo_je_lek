import 'package:flutter/material.dart';
import 'package:stacionar_app/utils/app_theme.dart';

class MealContainer extends StatelessWidget {
  final String mealType;
  final mealContainerColor;
  final String imageName;
  final String mealTime;

  final double borderRadius = 12;

  const MealContainer({
    super.key,
    required this.mealType,
    required this.mealContainerColor,
    required this.imageName,
    required imagePaths,
    required this.mealTime,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: mealContainerColor[50],
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          children: [
            // price
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: mealContainerColor[100],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(borderRadius),
                      topRight: Radius.circular(borderRadius),
                    ),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Text(mealTime, style: CustomTheme.caption),
                ),
              ],
            ),

            // meal picture
            Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(imageName, height: 100),
            ),

            // meal flavor
            Expanded(
              child: Text(
                mealType,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
