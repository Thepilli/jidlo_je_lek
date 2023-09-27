import 'package:flutter/material.dart';

class Meal {
  final String mealType;
  final Color mealPlanColor;
  final String mealIconPath;
  final List<MealImage> mealImageAssets;
  final String mealTime;

  Meal({
    required this.mealType,
    required this.mealPlanColor,
    required this.mealIconPath,
    required this.mealImageAssets,
    required this.mealTime,
  });
}

class MealImage {
  final String mealImagePath;
  final String mealImageDescription;

  MealImage({
    required this.mealImagePath,
    required this.mealImageDescription,
  });
}

List<Meal> mealList = [
  Meal(
    mealType: "Snídaně",
    mealPlanColor: Colors.red,
    mealIconPath: "assets/icons/meal_plan_tile_snidane.png",
    mealImageAssets: [
      MealImage(
        mealImagePath: "assets/images/meal_plans/breakfast/breakfast_normal_01.jpg",
        mealImageDescription: "Normální porce:\nslaná",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/breakfast/breakfast_normal_02.jpg",
        mealImageDescription: "Normální porce:\nsladká",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/breakfast/breakfast_large_01.jpg",
        mealImageDescription: "Zvýšená porce:\nslaná",
      ),
    ],
    mealTime: "8:00",
  ),
  Meal(
    mealType: "Svačina",
    mealPlanColor: Colors.pink,
    mealIconPath: "assets/icons/meal_plan_tile_svacina.png",
    mealImageAssets: [
      MealImage(
        mealImagePath: "assets/images/meal_plans/snack/snack_normal_02.jpg",
        mealImageDescription: "Normální porce:\novoce",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/snack/snack_normal_01.jpg",
        mealImageDescription: "Normální porce:\novoce",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/snack/snack_large_01.jpg",
        mealImageDescription: "Zvýšená porce:\nsladká",
      ),
    ],
    mealTime: "10:00",
  ),
  Meal(
    mealType: "Oběd",
    mealPlanColor: Colors.purple,
    mealIconPath: "assets/icons/meal_plan_tile_obed.png",
    mealImageAssets: [
      MealImage(
        mealImagePath: "assets/images/meal_plans/lunch/lunch_normal_01.jpg",
        mealImageDescription: "Normální porce",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/lunch/lunch_normal_02.jpg",
        mealImageDescription: "Normální porce",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/lunch/lunch_large_01.jpg",
        mealImageDescription: "Zvýšená porce",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/lunch/lunch_large_02.jpg",
        mealImageDescription: "Zvýšená porce",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/lunch/lunch_large_03.jpg",
        mealImageDescription: "Zvýšená porce",
      ),
    ],
    mealTime: "12:00",
  ),
  Meal(
    mealType: "Druhá Svačina",
    mealPlanColor: Colors.blue,
    mealIconPath: "assets/icons/meal_plan_tile_svaciana_2.png",
    mealImageAssets: [
      MealImage(
        mealImagePath: "assets/images/meal_plans/aftersnack/aftersnack_normal_01.jpg",
        mealImageDescription: "Normální porce:\nsladká",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/aftersnack/aftersnack_normal_02.jpg",
        mealImageDescription: "Normální porce:\nslaná",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/aftersnack/aftersnack_large_01.jpg",
        mealImageDescription: "Zvýšená porce:\nsladká",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/aftersnack/aftersnack_large_02.jpg",
        mealImageDescription: "Zvýšená porce:\nslaná",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/aftersnack/aftersnack_large_03.jpg",
        mealImageDescription: "Zvýšená porce:\nsladká",
      ),
    ],
    mealTime: "16:00",
  ),
  Meal(
    mealType: "Večeře",
    mealPlanColor: Colors.cyan,
    mealIconPath: "assets/icons/meal_plan_tile_vecere.png",
    mealImageAssets: [
      MealImage(
        mealImagePath: "assets/images/meal_plans/dinner/dinner_normal_01.jpg",
        mealImageDescription: "Normální porce:\nteplá",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/dinner/dinner_normal_02.jpg",
        mealImageDescription: "Normální porce:\nstudená",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/dinner/dinner_large_01.jpg",
        mealImageDescription: "Zvýšená porce:\nstudená",
      ),
    ],
    mealTime: "19:00",
  ),
  Meal(
    mealType: "Druhá Večeře",
    mealPlanColor: Colors.teal,
    mealIconPath: "assets/icons/meal_plan_tile_vecere_2.png",
    mealImageAssets: [
      MealImage(
        mealImagePath: "assets/images/meal_plans/afterdinner/afterdinner_normal_01.jpg",
        mealImageDescription: "Normální porce:",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/afterdinner/afterdinner_normal_02.jpg",
        mealImageDescription: "Normální porce:",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/afterdinner/afterdinner_large_01.jpg",
        mealImageDescription: "Zvýšená porce:",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/afterdinner/afterdinner_large_02.jpg",
        mealImageDescription: "Zvýšená porce:",
      ),
    ],
    mealTime: "21:00",
  ),
  Meal(
    mealType: "Ukázkový jídelníček - Normální porce:",
    mealPlanColor: Colors.green,
    mealIconPath: "assets/icons/meal_plan_tile_model.png",
    mealImageAssets: [
      MealImage(
        mealImagePath: "assets/images/meal_plans/model_01/breakfast_model_01.jpg",
        mealImageDescription: "Snídaně",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/model_01/snack_model_01.jpg",
        mealImageDescription: "Svačina",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/model_01/lunch_model_01.jpg",
        mealImageDescription: "Oběd",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/model_01/aftersnack_model_01.jpg",
        mealImageDescription: "Svačina",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/model_01/dinner_model_01.jpg",
        mealImageDescription: "Večeře",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/model_01/afterdinner_model_01.jpg",
        mealImageDescription: "Druhá Večeře",
      ),
    ],
    mealTime: "Varianta 1",
  ),
  Meal(
    mealType: "Ukázkový jídelníček - Normální porce:",
    mealPlanColor: Colors.yellow,
    mealIconPath: "assets/icons/meal_plan_tile_model.png",
    mealImageAssets: [
      MealImage(
        mealImagePath: "assets/images/meal_plans/model_02/breakfast_model_02.jpg",
        mealImageDescription: "Snídaně",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/model_02/snack_model_02.jpg",
        mealImageDescription: "Svačina",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/model_02/lunch_model_02.jpg",
        mealImageDescription: "Oběd",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/model_02/aftersnack_model_02.jpg",
        mealImageDescription: "Svačina",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/model_02/dinner_model_02.jpg",
        mealImageDescription: "Večeře",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/model_02/afterdinner_model_02.jpg",
        mealImageDescription: "Druhá Večeře",
      ),
    ],
    mealTime: "Varianta 2",
  ),
  Meal(
    mealType: "Ukázkový jídelníček - Normální porce:",
    mealPlanColor: Colors.orange,
    mealIconPath: "assets/icons/meal_plan_tile_model.png",
    mealImageAssets: [
      MealImage(
        mealImagePath: "assets/images/meal_plans/model_03/breakfast_model_03.jpg",
        mealImageDescription: "Snídaně",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/model_03/snack_model_03.jpg",
        mealImageDescription: "Svačina",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/model_03/lunch_model_03.jpg",
        mealImageDescription: "Oběd",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/model_03/aftersnack_model_03.jpg",
        mealImageDescription: "Svačina",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/model_03/dinner_model_03.jpg",
        mealImageDescription: "Večeře",
      ),
      MealImage(
        mealImagePath: "assets/images/meal_plans/model_03/afterdinner_model_03.jpg",
        mealImageDescription: "Druhá Večeře",
      ),
    ],
    mealTime: "Varianta 3",
  ),
];
