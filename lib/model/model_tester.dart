import 'package:flutter/material.dart';
import 'meal_plans.dart';
import 'model_tester2.dart';

class Listerino extends StatelessWidget {
  final List<Meal> mealList;

  const Listerino({
    Key? key,
    required this.mealList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: mealList.length,
        itemBuilder: (context, index) {
          Meal meal = mealList[index];
          return ListTile(
            leading: Image.asset(
              meal.mealIconPath,
              width: 24,
              height: 24,
            ),
            title: Text(meal.mealType),
            subtitle: Text(meal.mealTime),
            tileColor: meal.mealPlanColor,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Galery(
                        mealType: meal.mealType,
                        mealContainerColor: meal.mealPlanColor,
                        immageAssets: meal.mealImageAssets),
                  ));
            },
          );
        },
      ),
    );
  }
}
