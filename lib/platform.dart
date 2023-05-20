import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformDetails {
  static final PlatformDetails _singleton = PlatformDetails._internal();
  factory PlatformDetails() {
    return _singleton;
  }
  PlatformDetails._internal();
  bool get isDesktop =>
      defaultTargetPlatform == TargetPlatform.macOS ||
      defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.windows;
  bool get isMobile =>
      defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.android;
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (PlatformDetails().isMobile) ...[
          const Center(
            child: Text(
              'Mobile',
              style: TextStyle(fontSize: 74, fontWeight: FontWeight.bold),
            ),
          )
        ] else if (PlatformDetails().isDesktop) ...[
          const Center(
            child: Text(
              'Desktop',
              style: TextStyle(fontSize: 74, fontWeight: FontWeight.bold),
            ),
          )
        ] else ...[
          const Center(
            child: Text(
              'Web',
              style: TextStyle(fontSize: 74, fontWeight: FontWeight.bold),
            ),
          )
        ]
      ],
    );
  }
}
