import 'package:bmi/other/decorations.dart';
import 'package:flutter/material.dart';

import '../other/mainButton.dart';

class ResultScreen extends StatelessWidget {
  final String _bmi;
  final String _result;
  final String _msg;
  Widget _createText(
      {required String text, required double size, Color? color}) {
    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color,
          fontSize: size,
        ),
      ),
    );
  }

  Widget _addPadding({required Widget wid}) {
    return Padding(padding: const EdgeInsets.all(8), child: wid);
  }

  const ResultScreen(
      {super.key,
      required String bmi,
      required String result,
      required String msg})
      : _msg = msg,
        _result = result,
        _bmi = bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Result",
          style: TextStyle(fontSize: 50),
        ),
      ),
      body: _addPadding(
        wid: Column(
          children: [
            Expanded(
              flex: 9,
              child: _addPadding(
                wid: Container(
                  decoration: decorateContainer(),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 1,
                          child: _createText(
                              text: _result,
                              size: 30,
                              color: const Color.fromARGB(255, 249, 212, 56))),
                      Expanded(
                          flex: 3, child: _createText(text: _bmi, size: 70)),
                      Expanded(
                          flex: 2, child: _createText(text: _msg, size: 25)),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: _addPadding(
                wid: MainButton(
                  msg: 'Go Back',
                  onTap: () {
                    Navigator.pop(context);
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
