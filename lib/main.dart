import 'package:flutter/material.dart';

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
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            title: const AppTitle(),
          ),
          body: const AppBody(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppTitle extends StatefulWidget {
  const AppTitle({super.key});

  @override
  State<AppTitle> createState() => _AppTitleState();
}

class _AppTitleState extends State<AppTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white12,
          border: Border.all(width: 0),
          borderRadius: BorderRadius.circular(20)),
      child: const Center(
        child: Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white),
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
  Color selectedColor = Colors.white12;
  Color selectedColor2 = Colors.white12;
  int weight = 50;
  int age = 10;

  Yes() {
    setState(() {
      selectedColor = Colors.white10;
      selectedColor2 = Colors.white12;
    });
  }

  No() {
    setState(() {
      selectedColor = Colors.white12;
      selectedColor2 = Colors.white10;
    });
  }

  Widget _createGenderCards(
      {required IconData icon,
      required String text,
      required Color color,
      required VoidCallback fun}) {
    return GestureDetector(
      onTap: () {
        fun();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 40, left: 20, right: 10),
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

  Widget _createValuedCard({required String text, required Function fun}) {
    return GestureDetector(
      onTap: () {
        fun();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 10),
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white10,
          border: Border.all(width: 0),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              weight.toString(),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: null,
                  iconSize: 20,
                  style: ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(Size(20, 20)),
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.white24)),
                  icon: Icon(Icons.add),
                ),
                IconButton(
                  onPressed: null,
                  iconSize: 20,
                  style: ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(Size(20, 20)),
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.white24)),
                  icon: Icon(Icons.minimize),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _createGenderCards(
                    icon: Icons.male,
                    text: 'Male',
                    color: selectedColor,
                    fun: Yes),
              ),
              Expanded(
                child: _createGenderCards(
                    icon: Icons.female,
                    text: 'Female',
                    color: selectedColor2,
                    fun: No),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white10,
              border: Border.all(width: 0),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(''),
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _createValuedCard(text: 'Weight', fun: () {}),
              ),
              Expanded(
                child: _createValuedCard(text: 'Age', fun: () {}),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.white10,
              border: Border.all(width: 0),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(''),
          ),
        ),
      ],
    );
  }
}
