import 'package:bmi/screens/decorations/decorations.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final String bmi;
  final String result;
  final String msg;
  const ResultScreen(
      {super.key, required this.bmi, required this.result, required this.msg});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  createText({required String text, required double size, Color? color}) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: const Text(
          "Result",
          style: TextStyle(fontSize: 50),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: decorateContainer(color: Colors.white12, radius: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  createText(
                      text: widget.result, size: 30, color: Colors.green),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                  createText(text: widget.bmi, size: 70),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  createText(text: widget.msg, size: 25),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: decorateContainer(
                    color: const Color.fromRGBO(255, 0, 0, 100), radius: 10),
                child: const Center(
                  child: Text(
                    "Go Back",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
