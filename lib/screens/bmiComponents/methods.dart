import 'package:flutter/material.dart';

import '../../constants.dart';
import '../decorations/decorations.dart';

(double, String, String?) calculateBmi(
    {required double height, required double weight}) {
  double heightInMeters = height / 100.0;
  double bmi = weight / (heightInMeters * heightInMeters);

  String result = "";

  if (bmi < 18.5) {
    result = 'Underweight';
  } else if (bmi >= 18.5 && bmi < 25) {
    result = 'Normal weight';
  } else if (bmi >= 25 && bmi < 30) {
    result = 'Overweight';
  } else if (bmi >= 30 && bmi < 35) {
    result = 'Obesity Class I';
  } else if (bmi >= 35 && bmi < 40) {
    result = 'Obesity Class II';
  } else {
    result = 'Obesity Class III';
  }
  return (bmi, result, msg[result]);
}

Widget createButton(
    {required IconData icon,
    required double height,
    required double width,
    required double radius,
    required double pad,
    required VoidCallback onTap,
    required VoidCallback onPress,
    required Function(LongPressEndDetails) onEnd}) {
  return GestureDetector(
    onTap: onTap,
    onLongPress: onPress,
    onLongPressEnd: onEnd,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: pad),
      height: height,
      width: width,
      decoration: decorateContainer(color: Colors.white24, radius: radius),
      child: Icon(icon),
    ),
  );
}
