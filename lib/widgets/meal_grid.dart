import 'package:flutter/material.dart';

class MealTypePage extends StatelessWidget {
  final String mealType;
  final mealTileColor;
  final List imagePaths;

  MealTypePage(
      {required this.mealType,
      required this.imagePaths,
      required this.mealTileColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mealType),
      ),
      body: SafeArea(
        child: Container(
          color: mealTileColor[100],
          child: CustomScrollView(
            slivers: [
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 215, 229, 161),
                            Color.fromARGB(255, 79, 145, 189),
                          ],
                        ),
                      ),
                      child: Image.asset(
                        imagePaths[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  childCount: imagePaths.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
