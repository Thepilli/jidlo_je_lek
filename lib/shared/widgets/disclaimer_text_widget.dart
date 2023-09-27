import 'package:flutter/material.dart';
import 'package:stacionar_app/app/app_constants.dart';
import 'package:stacionar_app/shared/extensions/build_context.dart';

class DisclaimerText extends StatelessWidget {
  final String disclaimer;
  const DisclaimerText({super.key, required this.disclaimer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(jPadding8),
      child: Text(disclaimer, textAlign: TextAlign.center, style: context.textTheme.bodyMedium),
    );
  }
}
