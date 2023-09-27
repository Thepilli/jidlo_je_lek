import 'package:flutter/material.dart';
import 'package:stacionar_app/shared/extensions/build_context.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.label,
    this.obscureText = false,
    this.focusNode,
  });

  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      obscureText: obscureText,
      controller: controller,
      style: context.textTheme.bodyMedium,
      decoration: InputDecoration(
        floatingLabelAlignment: FloatingLabelAlignment.center,
        alignLabelWithHint: true,
        labelStyle: context.textTheme.bodyMedium,
        label: Text(
          label,
          style: context.textTheme.bodyMedium,
        ),
      ),
    );
  }
}
