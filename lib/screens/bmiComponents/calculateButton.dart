import 'package:flutter/material.dart';

import '../../constants.dart';
import '../decorations/decorations.dart';
import '../resultScreen.dart';
import 'methods.dart';

class CalculateButton extends StatefulWidget {
  const CalculateButton({super.key});

  @override
  State<CalculateButton> createState() => _CalculateButtonState();
}

class _CalculateButtonState extends State<CalculateButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        double bmi;
        String result;
        String? msg;
        (bmi, result, msg) = calculateBmi(height: height, weight: weight);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ResultScreen(
                  bmi: bmi.toStringAsFixed(2), result: result, msg: msg!)),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: decorateContainer(
            color: const Color.fromRGBO(255, 0, 0, 100), radius: 10),
        child: const Center(
          child: Text(
            "Calculate",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
