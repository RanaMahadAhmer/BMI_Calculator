import 'dart:async';

import 'package:flutter/material.dart';

import '../../other/constants.dart';
import '../../other/decorations.dart';
import '../../other/methods.dart';

class WeightAgeRow extends StatefulWidget {
  const WeightAgeRow({super.key});

  @override
  State<WeightAgeRow> createState() => _WeightAgeRowState();
}

class _WeightAgeRowState extends State<WeightAgeRow> {
  Timer? _timer;

  Widget _createLButton({required IconData icon, required VoidCallback fun}) {
    return createButton(
      icon: icon,
      height: 40,
      width: 60,
      radius: 15,
      pad: 10,
      onTap: fun,
      onPress: () {
        _timer = Timer.periodic(
          const Duration(milliseconds: 60),
          (timer) {
            setState(() {
              fun();
            });
          },
        );
      },
      onEnd: (_) => setState(
        () {
          _timer?.cancel();
        },
      ),
    );
  }

  Widget _createValuedCard(
      {required String text,
      required int value,
      required VoidCallback addFun,
      required VoidCallback subFun}) {
    return Container(
      decoration: decorateContainer(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            value.toString(),
            style: const TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _createLButton(icon: Icons.remove, fun: subFun),
              _createLButton(icon: Icons.add, fun: addFun),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 15,
          child: _createValuedCard(
            text: 'Weight (kg)',
            value: DefaultParamValues.weight.toInt(),
            addFun: () {
              setState(() {
                (DefaultParamValues.weight < Limits.weightMaxLimit)
                    ? ++DefaultParamValues.weight
                    : DefaultParamValues.weight;
              });
            },
            subFun: () {
              setState(() {
                (DefaultParamValues.weight > Limits.heightMinLimit)
                    ? --DefaultParamValues.weight
                    : DefaultParamValues.weight;
              });
            },
          ),
        ),
        const Expanded(child: Text('')),
        Expanded(
          flex: 15,
          child: _createValuedCard(
            text: 'Age',
            value: DefaultParamValues.age,
            addFun: () {
              setState(() {
                (DefaultParamValues.age < Limits.ageMaxLimit)
                    ? ++DefaultParamValues.age
                    : DefaultParamValues.age;
              });
            },
            subFun: () {
              setState(() {
                (DefaultParamValues.age > Limits.ageMinLimit)
                    ? --DefaultParamValues.age
                    : DefaultParamValues.age;
              });
            },
          ),
        ),
      ],
    );
  }
}
