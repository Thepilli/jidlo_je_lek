import 'dart:math' as math;
import 'package:flutter/material.dart';

class GaugeArrowAnimation extends StatefulWidget {
  final double value;

  const GaugeArrowAnimation({Key? key, required this.value}) : super(key: key);

  @override
  _GaugeArrowAnimationState createState() => _GaugeArrowAnimationState();
}

class _GaugeArrowAnimationState extends State<GaugeArrowAnimation>
    with SingleTickerProviderStateMixin {
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
  void didUpdateWidget(covariant GaugeArrowAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _controller.reset();
      double angle;
      if (widget.value <= 18.5) {
        angle = (widget.value * 2) * math.pi / 180;
      } else if (widget.value <= 25) {
        angle = ((widget.value - 18.5) * 6 + 36) * math.pi / 180;
      } else if (widget.value <= 30) {
        angle = ((widget.value - 25) * 12 + 72) * math.pi / 180;
      } else if (widget.value <= 35) {
        angle = ((widget.value - 30) * 12 + 108) * math.pi / 180;
      } else {
        angle = 144 * math.pi / 180;
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
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                width: 400,
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
                        alignment: Alignment.bottomCenter,
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
        ],
      ),
    );
  }
}
