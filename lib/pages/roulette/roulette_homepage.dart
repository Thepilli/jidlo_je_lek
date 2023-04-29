import 'dart:math';

import 'package:flutter/material.dart';

import 'package:roulette/roulette.dart';

import 'roulette_arrow_component.dart';

class MyRoulette extends StatelessWidget {
  const MyRoulette({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final RouletteController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          width: 260,
          height: 260,
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Roulette(
              // Provide controller to update its state
              controller: controller,
              // Configure roulette's appearance
              style: const RouletteStyle(
                dividerThickness: 4,
                dividerColor: Colors.white,
                textLayoutBias: .9,
                centerStickerColor: Color(0xFF1CDE8F),
              ),
            ),
          ),
        ),
        const ArrowComponent(),
      ],
    );
  }
}

class RouletteHomePage extends StatefulWidget {
  const RouletteHomePage({Key? key}) : super(key: key);

  @override
  State<RouletteHomePage> createState() => _RouletteHomePageState();
}

class _RouletteHomePageState extends State<RouletteHomePage>
    with SingleTickerProviderStateMixin {
  final _random = Random();

  late RouletteController _controller;

  final colors = <Color>[
    Colors.red.withAlpha(50),
    Colors.green.withAlpha(30),
    Colors.blue.withAlpha(70),
    Colors.yellow.withAlpha(90),
    Colors.amber.withAlpha(50),
    Colors.indigo.withAlpha(70),
  ];
  final names = <String>[
    'Red',
    'green',
    'blue',
    'yellow',
    'amber',
    'indigo',
  ];

  @override
  void initState() {
    // Initialize the controller
    final group = RouletteGroup.uniform(colors.length,
        textBuilder: names.elementAt,
        colorBuilder: colors.elementAt,
        textStyleBuilder: (index) => const TextStyle(
              fontSize: 10,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ));
    _controller = RouletteController(vsync: this, group: group);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: MyRoulette(controller: _controller),
      ),
      floatingActionButton: FloatingActionButton(
        // Use the controller to run the animation with rollTo method
        onPressed: () => _controller.rollTo(2,
            offset: _random.nextDouble(), minRotateCircles: 4),
        child: const Icon(Icons.refresh_rounded),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
