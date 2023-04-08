import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final String buttonText;

  const MyElevatedButton({required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 6, 67, 117),
        foregroundColor: Colors.white,
        shape: const StadiumBorder(),
      ),
      child: Text(buttonText),
    );
  }
}
