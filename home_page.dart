import 'package:flutter/material.dart';

final styleButton = ButtonStyle(
  overlayColor:
      MaterialStateProperty.all(const Color.fromARGB(255, 0, 13, 131)),
  foregroundColor:
      MaterialStateProperty.all<Color>(const Color.fromARGB(255, 0, 0, 0)),
  backgroundColor:
      MaterialStateProperty.all(const Color.fromARGB(255, 0, 149, 255)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
);

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(children: <Widget>[
          Container(
              height: 50,
              width: 200,
              margin: const EdgeInsets.all(8),
              child: OutlinedButton(
                style: styleButton,
                onPressed: () {
                  Navigator.pushNamed(context, '/angle');
                },
                child: const Text(
                  "Angle",
                  style: TextStyle(fontSize: 20),
                ),
              )),
          Container(
              height: 50,
              width: 200,
              margin: const EdgeInsets.all(8),
              child: OutlinedButton(
                style: styleButton,
                onPressed: () {
                  Navigator.pushNamed(context, '/area');
                },
                child: const Text(
                  "Area",
                  style: TextStyle(fontSize: 20),
                ),
              )),
          Container(
              height: 50,
              width: 200,
              margin: const EdgeInsets.all(8),
              child: OutlinedButton(
                style: styleButton,
                onPressed: () {
                  Navigator.pushNamed(context, '/currency');
                },
                child: const Text(
                  "Currency",
                  style: TextStyle(fontSize: 20),
                ),
              )),
          Container(
              height: 50,
              width: 200,
              margin: const EdgeInsets.all(8),
              child: OutlinedButton(
                style: styleButton,
                onPressed: () {
                  Navigator.pushNamed(context, '/data');
                },
                child: const Text(
                  "Data",
                  style: TextStyle(fontSize: 20),
                ),
              )),
          Container(
              height: 50,
              width: 200,
              margin: const EdgeInsets.all(8),
              child: OutlinedButton(
                style: styleButton,
                onPressed: () {
                  Navigator.pushNamed(context, '/energy');
                },
                child: const Text(
                  "Energy",
                  style: TextStyle(fontSize: 20),
                ),
              )),
          Container(
              height: 50,
              width: 200,
              margin: const EdgeInsets.all(8),
              child: OutlinedButton(
                style: styleButton,
                onPressed: () {
                  Navigator.pushNamed(context, '/length');
                },
                child: const Text(
                  "Length",
                  style: TextStyle(fontSize: 20),
                ),
              )),
          Container(
              height: 50,
              width: 200,
              margin: const EdgeInsets.all(8),
              child: OutlinedButton(
                style: styleButton,
                onPressed: () {
                  Navigator.pushNamed(context, '/power');
                },
                child: const Text(
                  "Power",
                  style: TextStyle(fontSize: 20),
                ),
              )),
          Container(
              height: 50,
              width: 200,
              margin: const EdgeInsets.all(8),
              child: OutlinedButton(
                style: styleButton,
                onPressed: () {
                  Navigator.pushNamed(context, '/pressure');
                },
                child: const Text(
                  "Pressure",
                  style: TextStyle(fontSize: 20),
                ),
              )),
          Container(
              height: 50,
              width: 200,
              margin: const EdgeInsets.all(8),
              child: OutlinedButton(
                style: styleButton,
                onPressed: () {
                  Navigator.pushNamed(context, '/speed');
                },
                child: const Text(
                  "Speed",
                  style: TextStyle(fontSize: 20),
                ),
              )),
          Container(
              height: 50,
              width: 200,
              margin: const EdgeInsets.all(8),
              child: OutlinedButton(
                style: styleButton,
                onPressed: () {
                  Navigator.pushNamed(context, '/temperature');
                },
                child: const Text(
                  "Temperature",
                  style: TextStyle(fontSize: 20),
                ),
              )),
          Container(
              height: 50,
              width: 200,
              margin: const EdgeInsets.all(8),
              child: OutlinedButton(
                style: styleButton,
                onPressed: () {
                  Navigator.pushNamed(context, '/time');
                },
                child: const Text(
                  "Time",
                  style: TextStyle(fontSize: 20),
                ),
              )),
          Container(
              height: 50,
              width: 200,
              margin: const EdgeInsets.all(8),
              child: OutlinedButton(
                style: styleButton,
                onPressed: () {
                  Navigator.pushNamed(context, '/volume');
                },
                child: const Text(
                  "Volume",
                  style: TextStyle(fontSize: 20),
                ),
              )),
          Container(
              height: 50,
              width: 200,
              margin: const EdgeInsets.all(8),
              child: OutlinedButton(
                style: styleButton,
                onPressed: () {
                  Navigator.pushNamed(context, '/weight');
                },
                child: const Text(
                  "Weight",
                  style: TextStyle(fontSize: 20),
                ),
              )),
        ]),
      )),
    );
  }
}
