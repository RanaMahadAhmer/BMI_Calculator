import 'package:flutter/material.dart';

int weight = 50;
int age = 10;

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

decorateBox({required Color color, required double radius}) {
  return BoxDecoration(
    color: color,
    border: Border.all(width: 0),
    borderRadius: BorderRadius.circular(radius),
  );
}

ButtonStyle buttonStyle = const ButtonStyle(
  minimumSize: MaterialStatePropertyAll(Size(20, 20)),
  backgroundColor: MaterialStatePropertyAll(Colors.white24),
);
