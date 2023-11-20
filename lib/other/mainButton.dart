import 'package:flutter/material.dart';

import 'decorations.dart';

class MainButton extends StatefulWidget {
  final VoidCallback onTap;
  final String msg;
  const MainButton({super.key, required this.onTap, required this.msg});

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: decorateContainer(
            color: const Color.fromARGB(255, 255, 65, 91), radius: 10),
        child: Center(
          child: Text(
            widget.msg,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
