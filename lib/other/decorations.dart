import 'package:flutter/material.dart';

const Color primaryCardColor = Colors.white12;
const double primaryCardRadius = 20;

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

decorateContainer(
    {Color color = primaryCardColor, double radius = primaryCardRadius}) {
  return BoxDecoration(
    color: color,
    border: Border.all(width: 0),
    borderRadius: BorderRadius.circular(radius),
  );
}
