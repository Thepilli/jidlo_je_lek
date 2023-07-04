import 'package:flutter/material.dart';
import 'package:stacionar_app/constants/sizes.dart';

class DisclaimerText extends StatelessWidget {
  final String disclaimer;
  const DisclaimerText({super.key, required this.disclaimer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(jPadding8),
      child: Text(disclaimer, textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelLarge),
    );
  }
}
