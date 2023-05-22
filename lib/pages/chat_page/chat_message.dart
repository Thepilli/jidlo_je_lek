import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({super.key, required this.text, required this.sender});

  final String text;
  final String sender;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(sender)
            .text
            .subtitle1(context)
            .make()
            .box
            .color(sender == "user"
                ? Colors.pink.withOpacity(0.5)
                : Colors.yellow.withOpacity(0.5))
            .p16
            .roundedFull
            .alignCenter
            .makeCentered(),
        Expanded(
          child: text.trim().text.bodyText1(context).make().px8(),
        )
      ],
    );
  }
}