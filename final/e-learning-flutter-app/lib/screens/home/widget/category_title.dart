import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class CategoryTitle extends StatelessWidget {

    final String leftText;
    final String rightText;
    CategoryTitle(this.leftText, this.rightText);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Padding left right symmetric 25 to match other widgets
      padding: const EdgeInsets.symmetric(horizontal: 25),
      // Put the texts into one row
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: kFont,
            ),
          ),
          Text(
            rightText,
            style: const TextStyle(
              fontSize: 16,
              color: kFontLight,
            ),
          ),
        ],
      ),
    );
  }
}