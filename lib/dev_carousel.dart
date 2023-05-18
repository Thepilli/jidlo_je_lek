import 'dart:convert';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'model/meal.dart';

class VerticalSliderDemo extends StatelessWidget {
  final List<Meal> meals;

  const VerticalSliderDemo({Key? key, required this.meals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // appBar: AppBar(title: const Text('Vertical sliding carousel demo')),
      child: FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/meal_images_map.json'),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            final jsonContent = snapshot.data!;
            final List<Meal> meals = List.from(jsonDecode(jsonContent))
                .map((json) => Meal.fromJson(json))
                .where((meal) => meal.category == 'sladka_jidla')
                .toList();

            return CarouselSlider(
              options: CarouselOptions(
                // height: 300,
                aspectRatio: 2,
                viewportFraction: 1,
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
                enlargeFactor: 0.5,
                disableCenter: false,
                padEnds: true,
                clipBehavior: Clip.hardEdge,
              ),
              items: meals
                  .map((meal) => Container(
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          child: ClipRRect(
                              //the main card shape
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20.0)),
                              child: Image.asset(
                                'assets/images/havelska_koruna/${meal.category}/${meal.imgsource}',
                                fit: BoxFit.scaleDown,
                                height: 200.0,
                              )),
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
