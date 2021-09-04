import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, required this.cardChild, required this.onPresed});

  final Color colour;
  final Widget cardChild;
  final Function onPresed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onPresed,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: colour,
        ),
      ),
    );
  }
}