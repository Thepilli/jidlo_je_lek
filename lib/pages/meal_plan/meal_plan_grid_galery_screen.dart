import 'package:flutter/material.dart';
import 'package:stacionar_app/utils/app_theme.dart';

class MealPlanGridGaleryScreen extends StatelessWidget {
  final String mealType;
  final mealContainerColor;
  final List imagePaths;

  const MealPlanGridGaleryScreen(
      {super.key,
      required this.mealType,
      required this.imagePaths,
      required this.mealContainerColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mealContainerColor.withAlpha(80),
        title: Text(mealType, style: CustomTheme.h4),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: CustomScrollView(
            slivers: [
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.5,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: mealContainerColor.withAlpha(80),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              imagePaths[index][0],
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            imagePaths[index][1],
                            style: CustomTheme.caption,
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
