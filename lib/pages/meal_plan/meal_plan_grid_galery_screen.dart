import 'package:flutter/material.dart';
import 'package:stacionar_app/utils/app_theme.dart';

import '../../widgets/gallery_pop.dart';

class MealPlanGridGaleryScreen extends StatelessWidget {
  final String mealType;
  final dynamic mealContainerColor;
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
                  childAspectRatio: 2.5,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: mealContainerColor.withAlpha(80),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: SizedBox(
                              // height: 100,
                              width: 200,
                              child: InkwellPop(
                                imgPath: imagePaths[index][0],
                              ),
                            ),
                          ),
                          const SizedBox(width: 30.0),
                          Flexible(
                            child: Text(
                              imagePaths[index][1],
                              textAlign: TextAlign.center,
                              style: CustomTheme.caption,
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
