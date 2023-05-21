import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

Widget disclaimerText(String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      text,
      style: CustomTheme.body1,
      textAlign: TextAlign.center,
    ),
  );
}
