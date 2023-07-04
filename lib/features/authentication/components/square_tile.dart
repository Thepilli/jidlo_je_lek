import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacionar_app/constants/colors.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  const SquareTile({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    var isDark = Get.isDarkMode;
    var borderColor = isDark ? jPrimaryDarkColor : jPrimaryLightColor;
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor.withOpacity(0.5), width: 3),
            borderRadius: BorderRadius.circular(16),
            color: Colors.transparent,
          ),
          child: Image.asset(
            imagePath,
            height: 40,
            width: 40,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(23),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.withOpacity(.5),
          ),
          child: const Icon(
            Icons.lock,
            size: 40,
          ),
        ),
      ],
    );
  }
}
