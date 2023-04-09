import 'package:flutter/material.dart';
import 'package:stacionar_app/widgets/meal_tile.dart';

class MealTab extends StatelessWidget {
  // list of meals
  List mealsOnSale = [
    // [ mealType,  mealTileColor, imageName ]
    ["Snidane", Colors.blue, "assets/icons/tile_snidane.png"],
    ["Svacina", Colors.red, "assets/icons/tile_svacina.png"],
    ["Obed", Colors.purple, "assets/icons/tile_obed.png"],
    ["Odpoledni Svacina", Colors.brown, "assets/icons/tile_svaciana_2.png"],
    ["Vecere", Colors.brown, "assets/icons/tile_vecere.png"],
    ["Druha Vecere", Colors.brown, "assets/icons/tile_vecere_2.png"],
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
        return MealTile(
          mealType: mealsOnSale[index][0],
          mealTileColor: mealsOnSale[index][1],
          imageName: mealsOnSale[index][2],
        );
      },
    );
  }
}
