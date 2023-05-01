import 'package:flutter/material.dart';
import 'package:stacionar_app/utils/mytextstyles.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Aplikace má sedm základních modulů: deprese, úzkost/panika, sebepoškozování, myšlenky na sebevraždu, sledování nálady, poruchy příjmu potravy a kontakty na odbornou pomoc.',
            style: MyTextStyles.bodyText1,
          ),
        ),
        const Image(
          image: AssetImage('assets/images/nepanikar_logo.png'),
          color: Colors.deepPurple,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage('assets/images/nepanikar_app.png'),
              width: 200,
            ),
            Image(
              image: AssetImage('assets/images/nepanikar_qr.png'),
              width: 100,
            ),
          ],
        ),
      ],
    );
  }
}
