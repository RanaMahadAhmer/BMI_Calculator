import 'package:flutter/material.dart';

import 'bmiComponents/calculateButton.dart';
import 'bmiComponents/genderCardRow.dart';
import 'bmiComponents/heightSlider.dart';
import 'bmiComponents/weight&AgeRow.dart';

// TODO: Implement Screen Change Animation
class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});
  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  Widget insertTopPadding(double num) {
    return SizedBox(height: num);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "BMI",
          style: TextStyle(fontSize: 38),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            insertTopPadding(MediaQuery.of(context).size.height * 0.02),
            const GenderCardRow(),
            insertTopPadding(MediaQuery.of(context).size.height * 0.02),
            const HeightSlider(),
            insertTopPadding(MediaQuery.of(context).size.height * 0.02),
            const WeightAgeRow(),
            insertTopPadding(MediaQuery.of(context).size.height * 0.02),
            const CalculateButton(),
          ],
        ),
      ),
    );
  }
}
