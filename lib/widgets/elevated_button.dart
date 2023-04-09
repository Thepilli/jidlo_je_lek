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


// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       MyElevatedButton(buttonText: 'one'),
//       const SizedBox(width: 5),
//       MyElevatedButton(buttonText: 'two'),
//       const SizedBox(width: 5),
//       MyElevatedButton(buttonText: 'three'),
//       const SizedBox(width: 5),
//       MyElevatedButton(buttonText: 'four'),
//       const SizedBox(width: 5),
//       MyElevatedButton(buttonText: 'five'),
//     ],
//   ),
// ),