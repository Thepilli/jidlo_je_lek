import 'dart:convert';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stacionar_app/models/meal.dart';
import 'package:stacionar_app/shared/extensions/build_context.dart';
import 'package:stacionar_app/shared/widgets/contrained_container.dart';

class MealInspiration extends ConsumerWidget {
  const MealInspiration({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Co si dneska dám?",
          style: context.textTheme.bodyLarge,
        ),
      ),
      body: ConstrainedContainer(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "Hledáš inspiraci na možný oběd nebo večeři? Podívej se co vše se dá udělat:",
                    style: context.textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),
                // const Spacer(),
                Text(
                  "Polévky",
                  style: context.textTheme.bodyLarge,
                ),
                const GalleryContainer(selectedCategory: 'polevky'),
                // const Spacer(),
                Text(
                  "Hlavní jídla",
                  style: context.textTheme.bodyLarge,
                ),
                const GalleryContainer(selectedCategory: 'hlavni_jidla'),
                // const Spacer(),
                Text(
                  "Smažená jídla",
                  style: context.textTheme.bodyLarge,
                ),
                const GalleryContainer(selectedCategory: 'smazena_jidla'),
                // const Spacer(),
                Text(
                  "Sladká jídla",
                  style: context.textTheme.bodyLarge,
                ),
                const GalleryContainer(selectedCategory: 'sladka_jidla'),
                // const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GalleryContainer extends StatelessWidget {
  const GalleryContainer({
    super.key,
    required this.selectedCategory,
  });

  final String selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 15),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: context.primary, width: 4),
          borderRadius: BorderRadius.circular(12),
        ),
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('assets/meal_images_map.json'),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              final jsonContent = snapshot.data!;
              final List<Meal> meals = List.from(
                jsonDecode(jsonContent),
              )
                  .map(
                    (json) => Meal.fromJson(json),
                  )
                  .where((meal) => meal.category == selectedCategory)
                  .toList();

              return CarouselSlider(
                options: CarouselOptions(
                  // height: 250,
                  aspectRatio: 3,
                  viewportFraction: 0.9,
                  initialPage: Random().nextInt(meals.length),
                  animateToClosest: true,
                  // autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 1),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  pageSnapping: false,
                  scrollDirection: Axis.vertical,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                  enlargeFactor: 0.3,
                  disableCenter: false,
                  padEnds: true,
                  clipBehavior: Clip.hardEdge,
                ),
                items: meals
                    .map(
                      (meal) => Container(
                        child: Container(
                          height: 140,
                          decoration: BoxDecoration(
                            color: context.primary.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          width: (MediaQuery.of(context).size.width),
                          margin: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                //the main card shape
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                child: Image.asset(
                                  'assets/images/havelska_koruna/${meal.category}/${meal.imgsource}',
                                  fit: BoxFit.fitHeight,
                                  height: 250.0,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Text(
                                    meal.titleDia,
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.center,
                                    style: context.textTheme.bodyLarge,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            } else if (snapshot.hasError) {
              return Text(
                'Error loading JSON file',
                style: context.textTheme.bodyMedium,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
