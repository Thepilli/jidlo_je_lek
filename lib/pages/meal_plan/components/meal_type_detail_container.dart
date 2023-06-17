import 'package:flutter/material.dart';
import 'package:stacionar_app/constants/sizes.dart';

import '../../../widgets/gallery_pop.dart';

class MealPlanDetailContainer extends StatelessWidget {
  final dynamic mealPlanColor;
  final String mealImagePath;
  final String mealImageDescription;
  const MealPlanDetailContainer(
      {super.key, required this.mealPlanColor, required this.mealImagePath, required this.mealImageDescription});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 120,
          decoration: BoxDecoration(
            color: mealPlanColor[50],
            borderRadius: const BorderRadius.all(Radius.circular(jBorderRadius)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(jBorderRadius),
                  child: InkwellPop(
                    imgPath: mealImagePath,
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    mealImageDescription,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
