import 'package:e_learning_app/constants/colors.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      // Stack
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              border: Border.all(color: kFontLight, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              cursorColor: kFontLight,
              decoration: InputDecoration(
                fillColor: kFontLight.withOpacity(0.1),
                filled: true, 
                contentPadding: const EdgeInsets.all(18),
                border: InputBorder.none,
                hintText: 'Search for history, classes,...',
                hintStyle: const TextStyle(color: kFontLight),
              ),
            ),
          ),
          Positioned(
            right: 45,
            top: 35,
            child: Container(
              child: Image.asset(
                'assets/icons/search.png',
                 width: 20,
                ),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: kAccent,
                borderRadius: BorderRadius.circular(8),
                ),
            ),
          ),
        ],
      ),
    );
  }
}