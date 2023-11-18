import 'package:flutter/material.dart';

import 'constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart BMI Calculator',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "BMI",
              style: TextStyle(fontSize: 38),
            ),
          ),
          body: const AppBody(),
        ),
      ),
    );
  }
}

class AppBody extends StatefulWidget {
  const AppBody({super.key});

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  changeData(int data, int change) {
    setState(() {
      data = data + change;
    });
  }

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
        width: MediaQuery.of(context).size.width * 0.43,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(width: 0),
          borderRadius: BorderRadius.circular(20),
        ),
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

  Widget _createButton({required IconData icon, required VoidCallback fun}) {
    return IconButton(
      splashColor: Colors.red,
      onPressed: () {
        setState(() {
          fun();
        });
      },
      iconSize: 20,
      style: buttonStyle,
      icon: Icon(icon),
    );
  }

  Widget _createValuedCard(
      {required String text,
      required int value,
      required VoidCallback addFun,
      required VoidCallback subFun}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.43,
      decoration: decorateBox(color: Colors.white12, radius: 20),
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
              _createButton(icon: Icons.add, fun: addFun),
              _createButton(icon: Icons.remove, fun: subFun),
            ],
          )
        ],
      ),
    );
  }

  Widget insertTopPadding(double num) {
    return SizedBox(height: num);
  }

  // TODO: Modularize Into Screen
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          insertTopPadding(MediaQuery.of(context).size.height * 0.05),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _createGenderCards(
                    icon: Icons.male,
                    text: 'Male',
                    color: maleCardColor,
                    selectMale: true),
                _createGenderCards(
                    icon: Icons.female,
                    text: 'Female',
                    color: femaleCardColor,
                    selectMale: false),
              ],
            ),
          ),
          insertTopPadding(MediaQuery.of(context).size.height * 0.03),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: decorateBox(color: Colors.white12, radius: 10),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Height",
                  style: TextStyle(fontSize: 20),
                ),
                // TODO: Implement A Slider
                // Slider(value: 10, onChanged: null),
              ],
            ),
          ),
          insertTopPadding(MediaQuery.of(context).size.height * 0.03),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _createValuedCard(
                  text: 'Weight',
                  value: weight,
                  addFun: () {
                    (weight < 140) ? ++weight : weight;
                  },
                  subFun: () {
                    (weight > 1) ? --weight : weight;
                  },
                ),
                _createValuedCard(
                  text: 'Age',
                  value: age,
                  addFun: () {
                    (age < 140) ? ++age : age;
                  },
                  subFun: () {
                    (age > 1) ? --age : age;
                  },
                ),
              ],
            ),
          ),
          insertTopPadding(MediaQuery.of(context).size.height * 0.03),
          GestureDetector(
            onTap: () {
              // TODO: Implement Method to calculate the BMI
              print("object");
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: decorateBox(
                  color: const Color.fromRGBO(255, 0, 0, 100), radius: 10),
              child: const Center(
                child: Text(
                  "Calculate",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          insertTopPadding(20),
          const ElevatedButton(
            // TODO: Implement A Button To Change Theme Of App
            onPressed: null,
            child: Text("Hello"),
          ),
        ],
      ),
    );
  }
}
