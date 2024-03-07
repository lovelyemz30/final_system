import 'package:e_learning_app/constants/colors.dart';
import 'package:flutter/material.dart';

class EmojiText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding to match with Appbar text
      padding: const EdgeInsets.only(left: 25),
      // RichText to include sparkle emoji in text
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Let\'s boost your\nbrain power ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26, 
                color: kFont,
              ),
            ),
            TextSpan(
              text: '✨',
              style: TextStyle(fontSize: 26),
            ),
          ],
        ),
      ),
    );
  }
}