import 'package:flutter/material.dart';
import 'package:stacionar_app/shared/extensions/build_context.dart';

class MyButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  const MyButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(300, 70),
      ),
      onPressed: onPressed,
      child: SizedBox(
        child: Text(
          text,
          style: context.textTheme.bodyLarge,
        ),
      ),
    );
  }
}
