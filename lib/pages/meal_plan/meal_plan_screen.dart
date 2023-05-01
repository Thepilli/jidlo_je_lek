import 'package:flutter/material.dart';
import 'package:stacionar_app/pages/meal_plan/meal_plan_grid_galery_screen.dart';
import 'package:stacionar_app/pages/meal_plan/meal_plan_grid_container_list.dart';

class MealTab extends StatelessWidget {
  List foodMenu = [
    // [ mealType, mealTileColor, imageName, imagePaths, time ]
    [
      "Snídaně",
      Colors.blue,
      "assets/icons/tile_snidane.png",
      [
        [
          "assets/images/meal_plans/thumbnail/breakfast/breakfast_normal_01.jpg",
          "Normální porce - slaná"
        ],
        [
          "assets/images/meal_plans/thumbnail/breakfast/breakfast_normal_02.jpg",
          "Normální porce - sladká"
        ],
        [
          "assets/images/meal_plans/thumbnail/breakfast/breakfast_large_01.jpg",
          "Zvýšená porce - slaná"
        ],
      ],
      "8:00",
    ],
    [
      "Svačina",
      Colors.red,
      "assets/icons/tile_svacina.png",
      [
        [
          "assets/images/meal_plans/thumbnail/snack/snack_large_01.jpg",
          "Normální porce - ovoce"
        ],
        [
          "assets/images/meal_plans/thumbnail/snack/snack_normal_02.jpg",
          "Normální porce - ovoce"
        ],
        [
          "assets/images/meal_plans/thumbnail/snack/snack_normal_01.jpg",
          "Zvýšená porce - sladká"
        ],
      ],
      "10:00",
    ],
    [
      "Oběd",
      Colors.purple,
      "assets/icons/tile_obed.png",
      [
        [
          "assets/images/meal_plans/thumbnail/lunch/lunch_normal_01.jpg",
          "Normální porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/lunch/lunch_normal_02.jpg",
          "Normální porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/lunch/lunch_large_01.jpg",
          "Zvýšená porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/lunch/lunch_large_02.jpg",
          "Zvýšená porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/lunch/lunch_large_03.jpg",
          "Zvýšená porce"
        ],
      ],
      "12:00",
    ],
    [
      "Druhá Svačina",
      Colors.green,
      "assets/icons/tile_svaciana_2.png",
      [
        [
          "assets/images/meal_plans/thumbnail/aftersnack/aftersnack_normal_01.jpg",
          "Normální porce - sladká"
        ],
        [
          "assets/images/meal_plans/thumbnail/aftersnack/aftersnack_normal_02.jpg",
          "Normální porce - slaná"
        ],
        [
          "assets/images/meal_plans/thumbnail/aftersnack/aftersnack_large_01.jpg",
          "Zvýšená porce - sladká"
        ],
        [
          "assets/images/meal_plans/thumbnail/aftersnack/aftersnack_large_02.jpg",
          "Zvýšená porce - sladká"
        ],
        [
          "assets/images/meal_plans/thumbnail/aftersnack/aftersnack_large_03.jpg",
          "Zvýšená porce - sladká"
        ],
      ],
      "16:00",
    ],
    [
      "Večeře",
      Colors.orange,
      "assets/icons/tile_vecere.png",
      [
        [
          "assets/images/meal_plans/thumbnail/dinner/dinner_normal_01.jpg",
          "Normální porce - tepla"
        ],
        [
          "assets/images/meal_plans/thumbnail/dinner/dinner_normal_02.jpg",
          "Normální porce - studena"
        ],
        [
          "assets/images/meal_plans/thumbnail/dinner/dinner_large_01.jpg",
          "Zvýšená porce - studena"
        ],
      ],
      "19:00",
    ],
    [
      "Druhá Večeře",
      Colors.teal,
      "assets/icons/tile_vecere_2.png",
      [
        [
          "assets/images/meal_plans/thumbnail/afterdinner/afterdinner_normal_01.jpg",
          "Normální porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/afterdinner/afterdinner_normal_02.jpg",
          "Normální porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/afterdinner/afterdinner_large_01.jpg",
          "Zvýšená porce"
        ],
        [
          "assets/images/meal_plans/thumbnail/afterdinner/afterdinner_large_02.jpg",
          "Zvýšená porce"
        ],
      ],
      "21:00",
    ],
    [
      "Ukázkový jídelníček - \nNormální porce",
      Colors.lime,
      "assets/icons/tile_model.png",
      [
        [
          "assets/images/meal_plans/thumbnail/model_01/breakfast_model_01.jpg",
          "Snídaně"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_01/snack_model_01.jpg",
          "Svačina"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_01/lunch_model_01.jpg",
          "Oběd"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_01/aftersnack_model_01.jpg",
          "Svačina"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_01/dinner_model_01.jpg",
          "Večeře"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_01/afterdinner_model_01.jpg",
          "Druhá Večeře"
        ],
      ],
      "Varianta 1",
    ],
    [
      "Ukázkový jídelníček - \nNormální porce",
      Colors.amber,
      "assets/icons/tile_model.png",
      [
        [
          "assets/images/meal_plans/thumbnail/model_02/breakfast_model_02.jpg",
          "Snídaně"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_02/snack_model_02.jpg",
          "Svačina"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_02/lunch_model_02.jpg",
          "Oběd"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_02/aftersnack_model_02.jpg",
          "Svačina"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_02/dinner_model_02.jpg",
          "Večeře"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_02/afterdinner_model_02.jpg",
          "Druhá Večeře"
        ],
      ],
      "Varianta 2",
    ],
    [
      "Ukázkový jídelníček - \nZvýšená porce",
      Colors.indigo,
      "assets/icons/tile_model.png",
      [
        [
          "assets/images/meal_plans/thumbnail/model_03/breakfast_model_03.jpg",
          "Snídaně"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_03/snack_model_03.jpg",
          "Svačina"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_03/lunch_model_03.jpg",
          "Oběd"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_03/aftersnack_model_03.jpg",
          "Svačina"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_03/dinner_model_03.jpg",
          "Večeře"
        ],
        [
          "assets/images/meal_plans/thumbnail/model_03/afterdinner_model_03.jpg",
          "Druhá Večeře"
        ],
      ],
      "Varianta 3",
    ],
  ];

  MealTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        const Text(
          'Toto jsou ukázkové jídelníčky, \nvčetně časů kdy dané chody jíst.',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Expanded(
          child: GridView.builder(
            itemCount: foodMenu.length,
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1 / 0.6,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MealPlanGridGaleryScreen(
                              mealType: foodMenu[index][0],
                              mealContainerColor: foodMenu[index][1],
                              imagePaths: foodMenu[index][3],
                            )),
                  );
                },
                child: MealContainer(
                  mealType: foodMenu[index][0],
                  mealContainerColor: foodMenu[index][1],
                  imageName: foodMenu[index][2],
                  imagePaths: foodMenu[index][3],
                  mealTime: foodMenu[index][4],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}