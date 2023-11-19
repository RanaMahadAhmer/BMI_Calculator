import 'dart:async';

import 'package:flutter/material.dart';

import '../../constants.dart';
import '../decorations/decorations.dart';
import 'methods.dart';

class HeightSlider extends StatefulWidget {
  const HeightSlider({super.key});

  @override
  State<HeightSlider> createState() => _HeightSliderState();
}

class _HeightSliderState extends State<HeightSlider> {
  Timer? timer;

  createLButton({required IconData icon, required int operand}) {
    return createButton(
      icon: icon,
      height: 50,
      width: 80,
      radius: 15,
      pad: 20,
      onTap: () {
        setState(
          () {
            height = height + operand;
          },
        );
      },
      onPress: () {
        timer = Timer.periodic(
          const Duration(milliseconds: 60),
          (timer) {
            setState(() {
              height = height + operand;
            });
          },
        );
      },
      onEnd: (_) => setState(
        () {
          timer?.cancel();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: decorateContainer(color: Colors.white12, radius: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Height",
            style: TextStyle(fontSize: 20),
          ),
          Slider(
            allowedInteraction: SliderInteraction.slideOnly,
            activeColor: const Color.fromRGBO(255, 0, 0, 100),
            thumbColor: const Color.fromRGBO(255, 0, 0, 1),
            value: height.toDouble(),
            min: 10,
            max: 300,
            divisions: 290,
            onChanged: (value) {
              setState(() {
                height = value;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              createLButton(icon: Icons.chevron_left, operand: -1),
              Text(
                "${height.toInt()} cm",
                style: const TextStyle(fontSize: 20),
              ),
              createLButton(icon: Icons.chevron_right, operand: 1),
            ],
          ),
        ],
      ),
    );
  }
}
