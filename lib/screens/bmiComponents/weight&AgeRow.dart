import 'dart:async';

import 'package:flutter/material.dart';

import '../../constants.dart';
import '../decorations/decorations.dart';
import 'methods.dart';

class WeightAgeRow extends StatefulWidget {
  const WeightAgeRow({super.key});

  @override
  State<WeightAgeRow> createState() => _WeightAgeRowState();
}

class _WeightAgeRowState extends State<WeightAgeRow> {
  Timer? timer;

  Widget _createValuedCard(
      {required String text,
      required int value,
      required VoidCallback addFun,
      required VoidCallback subFun}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.43,
      decoration: decorateContainer(color: Colors.white12, radius: 20),
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
              createButton(
                icon: Icons.remove,
                height: 50,
                width: 60,
                radius: 20,
                pad: 10,
                onTap: subFun,
                onPress: () {
                  timer = Timer.periodic(
                    const Duration(milliseconds: 60),
                    (timer) {
                      setState(() {
                        subFun();
                      });
                    },
                  );
                },
                onEnd: (_) => setState(
                  () {
                    timer?.cancel();
                  },
                ),
              ),
              createButton(
                icon: Icons.add,
                height: 50,
                width: 60,
                radius: 20,
                pad: 10,
                onTap: addFun,
                onPress: () {
                  timer =
                      Timer.periodic(const Duration(milliseconds: 60), (timer) {
                    setState(() {
                      addFun();
                    });
                  });
                },
                onEnd: (_) => setState(
                  () {
                    timer?.cancel();
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _createValuedCard(
            text: 'Weight (kg)',
            value: weight.toInt(),
            addFun: () {
              setState(() {
                (weight < 140) ? ++weight : weight;
              });
            },
            subFun: () {
              setState(() {
                (weight > 1) ? --weight : weight;
              });
            },
          ),
          _createValuedCard(
            text: 'Age',
            value: age,
            addFun: () {
              setState(() {
                (age < 140) ? ++age : age;
              });
            },
            subFun: () {
              setState(() {
                (age > 1) ? --age : age;
              });
            },
          ),
        ],
      ),
    );
  }
}
