import 'package:flutter/material.dart';

class MealGridScreen extends StatelessWidget {
  final String mealType;
  final mealTileColor;
  final List imagePaths;

  MealGridScreen(
      {required this.mealType,
      required this.imagePaths,
      required this.mealTileColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: mealTileColor[100],
        title: Text(mealType),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.0),
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
                        borderRadius: BorderRadius.circular(25.0),
                        color: mealTileColor.withAlpha(80),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              imagePaths[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            'Varianta $index',
                            style: TextStyle(
                              color: mealTileColor[900],
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
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
