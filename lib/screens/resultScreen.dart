import 'package:bmi/other/decorations.dart';
import 'package:bmi/other/methods.dart';
import 'package:flutter/material.dart';

import '../other/mainButton.dart';

class ResultScreen extends StatefulWidget {
  final String _bmi;
  final String _result;
  final String _msg;

  const ResultScreen({
    super.key,
    required String bmi,
    required String result,
    required String msg,
  })  : _msg = msg,
        _result = result,
        _bmi = bmi;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: isPortraitMode(context) ? 25 : null,
        title: Text(
          "Result",
          style: TextStyle(fontSize: isPortraitMode(context) ? 24 : 50),
        ),
      ),
      body: _addPadding(
        wid: Column(
          children: [
            Expanded(
              flex: (MediaQuery.of(context).size.height <
                      MediaQuery.of(context).size.width)
                  ? 3
                  : 9,
              child: _addPadding(
                wid: Container(
                  decoration: decorateContainer(),
                  child: Column(
                    children: [
                      Expanded(
                          child: _createText(
                              text: widget._result,
                              size: isPortraitMode(context) ? 30 : 20,
                              color: const Color.fromARGB(255, 249, 212, 56))),
                      Expanded(
                          flex: isPortraitMode(context) ? 3 : 1,
                          child: _createText(
                              text: widget._bmi,
                              size: isPortraitMode(context) ? 70 : 35)),
                      Expanded(
                          flex: isPortraitMode(context) ? 2 : 1,
                          child: _createText(
                              text: widget._msg,
                              size: isPortraitMode(context) ? 25 : 20)),
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
