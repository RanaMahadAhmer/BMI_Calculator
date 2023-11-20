import 'dart:async';

import 'package:flutter/material.dart';

import '../../other/constants.dart';
import '../../other/decorations.dart';
import '../../other/methods.dart';

class HeightSlider extends StatefulWidget {
  const HeightSlider({super.key});

  @override
  State<HeightSlider> createState() => _HeightSliderState();
}

class _HeightSliderState extends State<HeightSlider> {
  Timer? _timer;

  Widget _createLButton({required IconData icon, required int operand}) {
    return createButton(
      icon: icon,
      height: 45,
      width: 80,
      radius: 15,
      pad: 20,
      onTap: () {
        setState(
          () {
            DefaultParamValues.height = DefaultParamValues.height + operand;
          },
        );
      },
      onPress: () {
        _timer = Timer.periodic(
          const Duration(milliseconds: 60),
          (timer) {
            setState(() {
              DefaultParamValues.height = DefaultParamValues.height + operand;
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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decorateContainer(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Height",
            style: TextStyle(fontSize: 20),
          ),
          Slider(
            allowedInteraction: SliderInteraction.slideOnly,
            activeColor: const Color.fromARGB(150, 93, 206, 196),
            thumbColor: const Color.fromARGB(255, 74, 175, 163),
            value: DefaultParamValues.height.toDouble(),
            min: Limits.heightMinLimit,
            max: Limits.heightMaxLimit,
            divisions: Limits.heightDivisions,
            onChanged: (value) {
              setState(() {
                DefaultParamValues.height = value;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _createLButton(icon: Icons.chevron_left, operand: -1),
              Text(
                "${DefaultParamValues.height.toInt()} cm",
                style: const TextStyle(fontSize: 20),
              ),
              _createLButton(icon: Icons.chevron_right, operand: 1),
            ],
          ),
        ],
      ),
    );
  }
}
