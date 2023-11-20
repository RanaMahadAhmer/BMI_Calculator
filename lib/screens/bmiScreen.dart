import 'package:bmi/screens/resultScreen.dart';
import 'package:flutter/material.dart';

import '../other/constants.dart';
import '../other/mainButton.dart';
import '../other/methods.dart';
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
  Widget _addPadding({required Widget wid}) {
    return Padding(padding: const EdgeInsets.all(8), child: wid);
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
      body: _addPadding(
        wid: Column(
          children: [
            Expanded(flex: 3, child: _addPadding(wid: const GenderCardRow())),
            Expanded(flex: 3, child: _addPadding(wid: const HeightSlider())),
            Expanded(flex: 3, child: _addPadding(wid: const WeightAgeRow())),
            Expanded(
              child: _addPadding(
                wid: MainButton(
                  msg: 'Calculate',
                  onTap: () {
                    double bmi;
                    String result;
                    String? msg;
                    (bmi, result, msg) = calculateBmi(
                        height: DefaultParamValues.height,
                        weight: DefaultParamValues.weight);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultScreen(
                              bmi: bmi.toStringAsFixed(2),
                              result: result,
                              msg: msg!)),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
