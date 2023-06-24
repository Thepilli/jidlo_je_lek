// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class ConstrainedContainer extends StatelessWidget {
//   final Widget child;

//   const ConstrainedContainer({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     const bool isWeb = kIsWeb;
//     final double screenWidth = MediaQuery.of(context).size.width;

//     return Container(
//       constraints: BoxConstraints(
//         maxWidth: isWeb ? (screenWidth > 500 ? 550 : 550) : 550,
//       ),
//       child: child,
//     );
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ConstrainedContainer extends StatelessWidget {
  final Widget child;

  const ConstrainedContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    const bool isWeb = kIsWeb;

    return Container(
      constraints: const BoxConstraints(
        maxWidth: isWeb ? 1000 : double.infinity,
      ),
      child: child,
    );
  }
}
