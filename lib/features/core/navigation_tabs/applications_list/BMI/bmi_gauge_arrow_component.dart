import 'dart:math' as math;

import 'package:flutter/material.dart';

class BmiGaugeArrowAnimation extends StatefulWidget {
  final double value;

  const BmiGaugeArrowAnimation({super.key, required this.value});

  @override
  _BmiGaugeArrowAnimationState createState() => _BmiGaugeArrowAnimationState();
}

class _BmiGaugeArrowAnimationState extends State<BmiGaugeArrowAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation = Tween<double>(
      begin: -math.pi / 2,
      end: -math.pi / 2,
    ).animate(_controller);
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant BmiGaugeArrowAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _controller.reset();
      double angle;
      if (widget.value <= .49) {
        angle = 0.05;
      } else if (widget.value <= 18.49) {
        angle = (widget.value - 13.5) / 26 * math.pi;
      } else if (widget.value <= 24.99) {
        angle = ((widget.value - 18.5) / 7.5 * 40 + 40) / 180 * math.pi;
      } else if (widget.value <= 29.99) {
        angle = ((widget.value - 25) / 4.99 * 32 + 80) / 180 * math.pi;
      } else if (widget.value <= 34.99) {
        angle = ((widget.value - 30) / 4.99 * 35 + 112) / 180 * math.pi;
      } else {
        angle = math.pi - 0.05;
      }
      _animation = Tween<double>(
        begin: -math.pi / 2,
        end: angle - math.pi / 2,
      ).animate(_controller);
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 392,
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bmi_gauge.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 153, left: 10),
                child: SizedBox(
                  height: 100,
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.rotate(
                        alignment: const Alignment(0.0, 1.0),
                        angle: _animation.value,
                        child: Image.asset(
                          'assets/images/gauge_arrow.png',
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
