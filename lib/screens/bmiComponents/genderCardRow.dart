import 'package:flutter/material.dart';

import '../../other/decorations.dart';

class GenderCardRow extends StatefulWidget {
  const GenderCardRow({super.key});

  @override
  State<GenderCardRow> createState() => _GenderCardRowState();
}

class _GenderCardRowState extends State<GenderCardRow> {
  Widget _createGenderCards(
      {required IconData icon,
      required String text,
      required Color color,
      required bool selectMale}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          maleSelected = selectMale;
          changeGenderCardColor();
        });
      },
      child: Container(
        decoration: decorateContainer(color: color, radius: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 15,
          child: _createGenderCards(
              icon: Icons.male,
              text: 'Male',
              color: maleCardColor,
              selectMale: true),
        ),
        const Expanded(child: Text('')),
        Expanded(
          flex: 15,
          child: _createGenderCards(
              icon: Icons.female,
              text: 'Female',
              color: femaleCardColor,
              selectMale: false),
        ),
      ],
    );
  }
}
