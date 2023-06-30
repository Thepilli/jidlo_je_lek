import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  final AnimationController animationController;
  const WelcomeView({Key? key, required this.animationController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstHalfAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.6,
          0.8,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final secondHalfAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(-1, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.8,
          1.0,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    final welcomeFirstHalfAnimation = Tween<Offset>(
      begin: const Offset(2, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.6,
          0.8,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    final welcomeImageAnimation = Tween<Offset>(
      begin: const Offset(4, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.6,
          0.8,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    return SlideTransition(
      position: firstHalfAnimation,
      child: SlideTransition(
        position: secondHalfAnimation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SlideTransition(
              position: welcomeImageAnimation,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 350, maxHeight: 350),
                child: Image.asset(
                  'assets/images/introduction_animation/splash_4.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SlideTransition(
                position: welcomeFirstHalfAnimation,
                child: const Padding(
                  padding: EdgeInsets.only(left: 64, right: 64, top: 16, bottom: 16),
                  child: Text(
                    "Mnohé další",
                    style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                  ),
                )),
            const Padding(
              padding: EdgeInsets.only(left: 50, right: 50, top: 16, bottom: 16),
              child: Text(
                "Ať už jde o pomoc při úzkostných situacích, hledání dalších informací, možností relaxace, nebo třeba jen odreagování se při sledování videii, jste na správném místě.\nNeváhejte a začnete prozkoumávat",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}