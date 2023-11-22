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
  Widget _button() {
    return MainButton(
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
                  bmi: bmi.toStringAsFixed(2), result: result, msg: msg!)),
        );
      },
    );
  }

  Widget _landscapeBuild() {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 25,
        title: const Text(
          "BMI",
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: addPadding(
        wid: Row(
          children: [
            Expanded(flex: 3, child: addPadding(wid: const GenderCardRow())),
            Expanded(flex: 3, child: addPadding(wid: const WeightAgeRow())),
            Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Expanded(
                        flex: 3, child: addPadding(wid: const HeightSlider())),
                    Expanded(
                      child: addPadding(
                        wid: _button(),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isPortraitMode(context)
        ? Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "BMI",
                style: TextStyle(fontSize: 38),
              ),
            ),
            body: addPadding(
              wid: Column(
                children: [
                  Expanded(
                      flex: 3, child: addPadding(wid: const GenderCardRow())),
                  Expanded(
                      flex: 3, child: addPadding(wid: const HeightSlider())),
                  Expanded(
                      flex: 3, child: addPadding(wid: const WeightAgeRow())),
                  Expanded(
                    child: addPadding(
                      wid: _button(),
                    ),
                  ),
                ],
              ),
            ),
          )
        : _landscapeBuild();
  }
}
