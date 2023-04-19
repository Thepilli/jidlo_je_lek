import 'package:flutter/material.dart';
import 'package:stacionar_app/widgets/meal_grid_galery_screen.dart';
import 'package:stacionar_app/widgets/meal_grid_container.dart';

class MealTab extends StatelessWidget {
  List mealsOnSale = [
    // [ mealType, mealTileColor, imageName, imagePaths ]
    [
      "Snidane",
      Colors.blue,
      "assets/icons/tile_snidane.png",
      [
        [
          "assets/images/meal_plans/thumbnail/breakfast/breakfast_large_01.jpg",
          "zvysena porce - slana"
        ],
        [
          "assets/images/meal_plans/thumbnail/breakfast/breakfast_normal_01.jpg",
          "normalni porce - slana"
        ],
        [
          "assets/images/meal_plans/thumbnail/breakfast/breakfast_normal_02.jpg",
          "normalni porce - sladka"
        ],
      ],
      "8:00",
    ],
    [
      "Svacina",
      Colors.red,
      "assets/icons/tile_svacina.png",
      [
        [
          "assets/images/meal_plans/thumbnail/snack/snack_normal_01.jpg",
          "zvysena porce - sladka"
        ],
        [
          "assets/images/meal_plans/thumbnail/snack/snack_large_01.jpg",
          "normalni porce - ovoce"
        ],
        [
          "assets/images/meal_plans/thumbnail/snack/snack_normal_02.jpg",
          "normalni porce - ovoce"
        ],
      ],
      "10:00",
    ],
    [
      "Obed",
      Colors.purple,
      "assets/icons/tile_obed.png",
      [
        [
          "assets/images/meal_plans/thumbnail/lunch/lunch_normal_01.jpg",
          "normalni porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/lunch/lunch_large_01.jpg",
          "zvysena porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/lunch/lunch_normal_02.jpg",
          "normalni porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/lunch/lunch_large_02.jpg",
          "zvysena porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/lunch/lunch_large_03.jpg",
          "zvysena porce"
        ],
      ],
      "12:00",
    ],
    [
      "Druha svacina",
      Colors.brown,
      "assets/icons/tile_svaciana_2.png",
      [
        [
          "assets/images/meal_plans/thumbnail/aftersnack/aftersnack_normal_01.jpg",
          " porce - sladka"
        ],
        [
          "assets/images/meal_plans/thumbnail/aftersnack/aftersnack_normal_02.jpg",
          "normalni porce - slana"
        ],
        [
          "assets/images/meal_plans/thumbnail/aftersnack/aftersnack_large_01.jpg",
          "zvysena porce - sladka"
        ],
        [
          "assets/images/meal_plans/thumbnail/aftersnack/aftersnack_large_02.jpg",
          "zvysena porce - sladka"
        ],
        [
          "assets/images/meal_plans/thumbnail/aftersnack/aftersnack_large_03.jpg",
          "zvysena porce - sladka"
        ],
      ],
      "16:00",
    ],
    [
      "Vecere",
      Colors.brown,
      "assets/icons/tile_vecere.png",
      [
        [
          "assets/images/meal_plans/thumbnail/dinner/dinner_normal_01.jpg",
          "normalni porce - tepla"
        ],
        [
          "assets/images/meal_plans/thumbnail/dinner/dinner_large_01.jpg",
          "zvysena porce - studena"
        ],
        [
          "assets/images/meal_plans/thumbnail/dinner/dinner_normal_02.jpg",
          "normalni porce - studena"
        ],
      ],
      "19:00",
    ],
    [
      "afterdinner",
      Colors.brown,
      "assets/icons/tile_vecere_2.png",
      [
        [
          "assets/images/meal_plans/thumbnail/afterdinner/afterdinner_normal_01.jpg",
          "normalni porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/afterdinner/afterdinner_large_01.jpg",
          "zvysena porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/afterdinner/afterdinner_normal_02.jpg",
          "normalni porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/afterdinner/afterdinner_large_02.jpg",
          "zvysena porce"
        ],
      ],
      "21:00",
    ],
    [
      "Ukazkovy jidelnicek",
      Colors.brown,
      "assets/icons/tile_model.png",
      [
        [
          "assets/images/meal_plans/thumbnail/model_01/breakfast_model_01.jpg",
          "normalni porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_01/snack_model_01.jpg",
          "normalni porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_01/lunch_model_01.jpg",
          "normalni porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_01/aftersnack_model_01.jpg",
          "normalni porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_01/dinner_model_01.jpg",
          "normalni porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_01/afterdinner_model_01.jpg",
          "normalni porce"
        ],
      ],
      "Varianta 1",
    ],
    [
      "Ukazkovy jidelnicek",
      Colors.brown,
      "assets/icons/tile_model.png",
      [
        [
          "assets/images/meal_plans/thumbnail/model_02/breakfast_model_02.jpg",
          "normalni porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_02/snack_model_02.jpg",
          "normalni porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_02/lunch_model_02.jpg",
          "normalni porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_02/aftersnack_model_02.jpg",
          "normalni porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_02/dinner_model_02.jpg",
          "normalni porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_02/afterdinner_model_02.jpg",
          "normalni porce"
        ],
      ],
      "Varianta 2",
    ],
    [
      "Ukazkovy jidelnicek",
      Colors.brown,
      "assets/icons/tile_model.png",
      [
        [
          "assets/images/meal_plans/thumbnail/model_03/breakfast_model_03.jpg",
          "zvysena porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_03/snack_model_03.jpg",
          "zvysena porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_03/lunch_model_03.jpg",
          "zvysena porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_03/aftersnack_model_03.jpg",
          "zvysena porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_03/dinner_model_03.jpg",
          "zvysena porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_03/afterdinner_model_03.jpg",
          "zvysena porce"
        ],
      ],
      "Varianta 3",
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
                  builder: (context) => MealGridGaleryScreen(
                        mealType: mealsOnSale[index][0],
                        mealContainerColor: mealsOnSale[index][1],
                        imagePaths: mealsOnSale[index][3],
                      )),
            );
          },
          child: MealContainer(
            mealType: mealsOnSale[index][0],
            mealContainerColor: mealsOnSale[index][1],
            imageName: mealsOnSale[index][2],
            imagePaths: mealsOnSale[index][3],
            mealTime: mealsOnSale[index][4],
          ),
        );
      },
    );
  }
}
