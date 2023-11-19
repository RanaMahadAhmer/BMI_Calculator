import 'package:flutter/material.dart';

Color maleCardColor = Colors.white38;
Color femaleCardColor = Colors.white12;
bool maleSelected = true;

changeGenderCardColor() {
  if (maleSelected) {
    maleCardColor = Colors.white38;
    femaleCardColor = Colors.white10;
  } else {
    maleCardColor = Colors.white10;
    femaleCardColor = Colors.white38;
  }
}

decorateContainer({required Color color, required double radius}) {
  return BoxDecoration(
    color: color,
    border: Border.all(width: 0),
    borderRadius: BorderRadius.circular(radius),
  );
}
