import 'package:flutter/material.dart';
import 'package:stacionar_app/widgets/meal_grid.dart';
import 'package:stacionar_app/widgets/meal_tile.dart';

class MealTab extends StatelessWidget {
  List mealsOnSale = [
    // [ mealType, mealTileColor, imageName, imagePaths ]
    [
      "breakfast",
      Colors.blue,
      "assets/icons/tile_snidane.png",
      [
        "assets/images/meal_plans/thumbnail/breakfast/breakfast_large_01.jpg",
        "assets/images/meal_plans/thumbnail/breakfast/breakfast_normal_01.jpg",
        "assets/images/meal_plans/thumbnail/breakfast/breakfast_normal_02.jpg"
      ]
    ],
    [
      "snack",
      Colors.red,
      "assets/icons/tile_svacina.png",
      [
        "assets/images/meal_plans/thumbnail/snack/snack_normal_01.jpg",
        "assets/images/meal_plans/thumbnail/snack/snack_large_01.jpg",
        "assets/images/meal_plans/thumbnail/snack/snack_normal_02.jpg"
      ]
    ],
    [
      "lunch",
      Colors.purple,
      "assets/icons/tile_obed.png",
      [
        "assets/images/meal_plans/thumbnail/lunch/lunch_normal_01.jpg",
        "assets/images/meal_plans/thumbnail/lunch/lunch_large_01.jpg",
        "assets/images/meal_plans/thumbnail/lunch/lunch_normal_02.jpg",
        "assets/images/meal_plans/thumbnail/lunch/lunch_large_02.jpg",
        "assets/images/meal_plans/thumbnail/lunch/lunch_large_03.jpg",
      ]
    ],
    [
      "aftersnack",
      Colors.brown,
      "assets/icons/tile_svaciana_2.png",
      [
        "assets/images/meal_plans/thumbnail/aftersnack/aftersnack_normal_01.jpg",
        "assets/images/meal_plans/thumbnail/aftersnack/aftersnack_normal_02.jpg",
        "assets/images/meal_plans/thumbnail/aftersnack/aftersnack_large_01.jpg",
        "assets/images/meal_plans/thumbnail/aftersnack/aftersnack_large_02.jpg",
        "assets/images/meal_plans/thumbnail/aftersnack/aftersnack_large_03.jpg",
      ]
    ],
    [
      "dinner",
      Colors.brown,
      "assets/icons/tile_vecere.png",
      [
        "assets/images/meal_plans/thumbnail/dinner/dinner_normal_01.jpg",
        "assets/images/meal_plans/thumbnail/dinner/dinner_large_01.jpg",
        "assets/images/meal_plans/thumbnail/dinner/dinner_normal_02.jpg",
      ]
    ],
    [
      "afterdinner",
      Colors.brown,
      "assets/icons/tile_vecere_2.png",
      [
        "assets/images/meal_plans/thumbnail/afterdinner/afterdinner_normal_01.jpg",
        "assets/images/meal_plans/thumbnail/afterdinner/afterdinner_large_01.jpg",
        "assets/images/meal_plans/thumbnail/afterdinner/afterdinner_normal_02.jpg",
        "assets/images/meal_plans/thumbnail/afterdinner/afterdinner_large_02.jpg",
      ]
    ],
    [
      "model_1",
      Colors.brown,
      "assets/icons/tile_vecere_2.png",
      [
        "assets/images/meal_plans/thumbnail/model_01/breakfast_model_01.jpg",
        "assets/images/meal_plans/thumbnail/model_01/snack_model_01.jpg",
        "assets/images/meal_plans/thumbnail/model_01/lunch_model_01.jpg",
        "assets/images/meal_plans/thumbnail/model_01/aftersnack_model_01.jpg",
        "assets/images/meal_plans/thumbnail/model_01/dinner_model_01.jpg",
        "assets/images/meal_plans/thumbnail/model_01/afterdinner_model_01.jpg",
      ]
    ],
    [
      "model_2",
      Colors.brown,
      "assets/icons/tile_vecere_2.png",
      [
        "assets/images/meal_plans/thumbnail/model_02/breakfast_model_02.jpg",
        "assets/images/meal_plans/thumbnail/model_02/snack_model_02.jpg",
        "assets/images/meal_plans/thumbnail/model_02/lunch_model_02.jpg",
        "assets/images/meal_plans/thumbnail/model_02/aftersnack_model_02.jpg",
        "assets/images/meal_plans/thumbnail/model_02/dinner_model_02.jpg",
        "assets/images/meal_plans/thumbnail/model_02/afterdinner_model_02.jpg",
      ]
    ],
    [
      "model_2",
      Colors.brown,
      "assets/icons/tile_vecere_2.png",
      [
        "assets/images/meal_plans/thumbnail/model_03/breakfast_model_03.jpg",
        "assets/images/meal_plans/thumbnail/model_03/snack_model_03.jpg",
        "assets/images/meal_plans/thumbnail/model_03/lunch_model_03.jpg",
        "assets/images/meal_plans/thumbnail/model_03/aftersnack_model_03.jpg",
        "assets/images/meal_plans/thumbnail/model_03/dinner_model_03.jpg",
        "assets/images/meal_plans/thumbnail/model_03/afterdinner_model_03.jpg",
      ]
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: mealsOnSale.length,
      padding: EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 1 / 0.6,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MealTypePage(
                        mealType: mealsOnSale[index][0],
                        mealTileColor: mealsOnSale[index][1],
                        imagePaths: mealsOnSale[index][3],
                      )),
            );
          },
          child: MealTile(
            mealType: mealsOnSale[index][0],
            mealTileColor: mealsOnSale[index][1],
            imageName: mealsOnSale[index][2],
            imagePaths: mealsOnSale[index][3],
          ),
        );
      },
    );
  }
}
