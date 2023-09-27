import 'package:flutter/material.dart';
import 'package:stacionar_app/shared/extensions/build_context.dart';

class Intro extends StatefulWidget {
  final AnimationController animationController;

  const Intro({super.key, required this.animationController});

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    final introductionanimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0.0, -1.0),
    ).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: const Interval(
          0.0,
          0.2,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    return SlideTransition(
      position: introductionanimation,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 421,
              child: Image.asset(
                'assets/images/introduction_animation/splash_0.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                "Vítej!",
                style: context.textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 64, right: 64),
              child: Text(
                "Tato aplikace je určena pro všechny, kteří se potýkají s nemocí, nebo chtějí zjistit více o léčbě poruch příjmu potravy.",
                style: context.textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 16),
              child: InkWell(
                onTap: () {
                  widget.animationController.animateTo(0.2);
                },
                child: Container(
                  height: 58,
                  padding: const EdgeInsets.only(
                    left: 56.0,
                    right: 56.0,
                    top: 16,
                    bottom: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(38.0),
                    color: const Color(0xff132137),
                  ),
                  child: Text(
                    "Co zde najdu?",
                    style: context.textTheme.titleMedium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
