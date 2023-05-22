import 'dart:convert';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'model/meal.dart';

class VerticalSliderDemo extends StatefulWidget {
  final List<Meal> meals;

  const VerticalSliderDemo({Key? key, required this.meals}) : super(key: key);

  @override
  _VerticalSliderDemoState createState() => _VerticalSliderDemoState();
}

class _VerticalSliderDemoState extends State<VerticalSliderDemo> {
  String selectedCategory = 'hlavni_jidla'; // Default selected category

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 20),
              Radio<String>(
                value: 'hlavni_jidla',
                groupValue: selectedCategory,
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
              ),
              const SizedBox(width: 100, child: Text('Hlavní')),
              const SizedBox(width: 20),
              Radio<String>(
                value: 'smazena_jidla',
                groupValue: selectedCategory,
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
              ),
              const SizedBox(width: 100, child: Text('Smažená')),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 20),
              Radio<String>(
                value: 'sladka_jidla',
                groupValue: selectedCategory,
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
              ),
              const SizedBox(width: 100, child: Text('Sladká')),
              const SizedBox(width: 20),
              Radio<String>(
                value: 'polevky',
                groupValue: selectedCategory,
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
              ),
              const SizedBox(width: 100, child: Text('Polévky')),
            ],
          ),
        ),
        Container(
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
                    height: 250,
                    aspectRatio: 2,
                    viewportFraction: .6,
                    initialPage: Random().nextInt(meals.length),
                    animateToClosest: true,
                    // autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 1),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
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
                              width: MediaQuery.of(context).size.width,
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
        ),
      ],
    );
  }
}