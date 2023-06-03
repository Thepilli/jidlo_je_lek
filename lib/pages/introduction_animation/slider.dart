import 'dart:async';

import 'package:flutter/material.dart';

import 'package:slide_to_act/slide_to_act.dart';

import '../application_page/app_grid.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SlideAction(
                    borderRadius: 50,
                    outerColor: Colors.pinkAccent,
                    sliderButtonIcon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                      color: Colors.pink,
                    ),
                    text: "SWIPE TO START",
                    textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    onSubmit: () {
                      Timer(
                        const Duration(milliseconds: 500),
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ApplicationGrid(),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
