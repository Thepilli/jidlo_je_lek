import 'dart:convert';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stacionar_app/utils/app_theme.dart';

import '../../model/meal.dart';

class MealCarousel extends StatefulWidget {
  final List<Meal> meals;

  const MealCarousel({Key? key, required this.meals}) : super(key: key);

  @override
  _MealCarouselState createState() => _MealCarouselState();
}

class _MealCarouselState extends State<MealCarousel> {
  String selectedCategory = 'hlavni_jidla'; // Default selected category

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: FloatingActionButton(
            foregroundColor: Colors.white,
            backgroundColor: Colors.greenAccent.withOpacity(0.3),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              "Polévky",
              style: CustomTheme.h4,
            ),
            const GalleryContainer(selectedCategory: 'polevky'),
            const Spacer(),
            Text(
              "Hlavní jídla",
              style: CustomTheme.h4,
            ),
            const GalleryContainer(selectedCategory: 'hlavni_jidla'),
            const Spacer(),
            Text(
              "Smažená jídla",
              style: CustomTheme.h4,
            ),
            const GalleryContainer(selectedCategory: 'smazena_jidla'),
            const Spacer(),
            Text(
              "Sladká jídla",
              style: CustomTheme.h4,
            ),
            const GalleryContainer(selectedCategory: 'sladka_jidla'),
            const Spacer(),
          ],
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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.green,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      // appBar: AppBar(title: const Text('Vertical sliding carousel demo')),
      child: FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/meal_images_map.json'),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            final jsonContent = snapshot.data!;
            final List<Meal> meals = List.from(jsonDecode(jsonContent))
                .map((json) => Meal.fromJson(json))
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
                  .map((meal) => Container(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.greenAccent.withOpacity(0.5),
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
                                    Radius.circular(20.0)),
                                child: Image.asset(
                                  'assets/images/havelska_koruna/${meal.category}/${meal.imgsource}',
                                  fit: BoxFit.fitHeight,
                                  height: 250.0,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  meal.titleDia,
                                  overflow: TextOverflow.clip,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            );
          } else if (snapshot.hasError) {
            return const Text('Error loading JSON file');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
