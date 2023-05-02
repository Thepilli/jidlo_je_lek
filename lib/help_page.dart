import 'package:flutter/material.dart';
import 'package:stacionar_app/gallery_pop.dart';
import 'package:stacionar_app/utils/mytextstyles.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
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
            InkwellPop(
              imgPath: 'assets/images/nepanikar_app.png',
            ),
            InkwellPop(
              imgPath: 'assets/images/nepanikar_qr.png',
            ),
            // Image(
            //   image: AssetImage('assets/images/nepanikar_qr.png'),
            //   width: 100,
            // ),
          ],
        ),
      ],
    );
  }
}

class InkwellPop extends StatelessWidget {
  final String imgPath;

  const InkwellPop({
    super.key,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GalleryPop(
              heroTag: imgPath,
            ),
          ),
        );
      },
      child: Hero(
        tag: imgPath,
        child: Image(
          image: AssetImage(imgPath),
          width: 150,
        ),
      ),
    );
  }
}
