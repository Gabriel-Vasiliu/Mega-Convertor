import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mega_converter/history/angle_history_page.dart';

const List<String> options = <String>['Degrees', 'Radians'];

class AnglePage extends StatefulWidget {
  const AnglePage({super.key});

  @override
  State<AnglePage> createState() => _AnglePageState();
}

class _AnglePageState extends State<AnglePage> {
  final String title = "Mega Converter - Angle";
  TextEditingController textEditingController = TextEditingController();

  String option1 = options[0];
  String option2 = options[1];
  String number = "";
  String result = "";

  Future<void> setResult() async {
    if (double.tryParse(number) != null) {
      double res = 0;
      if (option1 == options[0] && option2 == options[1]) {
        // 1 degrees = 0.0174532925 radians
        res = double.parse(number) * 0.0174532925;
      } else if (option1 == options[1] && option2 == options[0]) {
        // 1 rad = 57.2957795 degrees
        res = double.parse(number) * 57.2957795;
      } else {
        res = double.parse(number);
      }
      setState(() {
        result = res.toStringAsFixed(6);
        if (res >= pow(10, 10)) {
          result = res.toStringAsExponential(4);
        }
      });

      if (option1 != option2) {
        await File('lib/history/angleHistory.txt').writeAsString(
            '$number $option1 -> $result $option2 \n',
            mode: FileMode.append);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255)),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: InteractiveViewer(
                minScale: 0.5,
                maxScale: 2,
                constrained: true,
                child: Center(
                    child: Column(children: [
                  Container(
                      width: 100,
                      height: 60,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: const Color.fromARGB(255, 6, 0, 96)),
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 105, 188, 255)),
                      child: DropdownButton<String>(
                          value: option1,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Color.fromARGB(255, 13, 0, 255),
                          ),
                          borderRadius: BorderRadius.circular(10),
                          dropdownColor:
                              const Color.fromARGB(255, 100, 181, 247),
                          onChanged: (String? value) {
                            setState(() {
                              option1 = value!;
                            });
                          },
                          items: options
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList())),
                  SizedBox(
                      width: 150,
                      child: TextField(
                        maxLines: 1,
                        maxLength: 10,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 0, 128, 255),
                                    width: 1)),
                            hoverColor: Colors.blue.shade100),
                        controller: textEditingController,
                        onChanged: (String? value) {
                          setState(() {
                            number = value!;
                          });
                        },
                      )),
                  Container(
                      width: 100,
                      height: 60,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: const Color.fromARGB(255, 6, 0, 96)),
                        color: const Color.fromARGB(255, 105, 188, 255),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton<String>(
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Color.fromARGB(255, 13, 0, 255),
                          ),
                          borderRadius: BorderRadius.circular(10),
                          dropdownColor:
                              const Color.fromARGB(255, 100, 181, 247),
                          value: option2,
                          onChanged: (String? value) {
                            setState(() {
                              option2 = value!;
                            });
                          },
                          items: options
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList())),
                  OutlinedButton(
                      onPressed: setResult,
                      style: OutlinedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 105, 188, 255),
                          foregroundColor: Colors.black,
                          shadowColor: const Color.fromARGB(255, 105, 188, 255),
                          elevation: 20,
                          padding: const EdgeInsets.all(20)),
                      child: const Text(
                          style: TextStyle(fontSize: 20), "Convert")),
                  Container(
                      width: 300,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(255, 0, 128, 255))),
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      child:
                          Text(style: const TextStyle(fontSize: 20), result)),
                ])),
              ))),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.history),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AngleHistoryPage(),
                ));
          }),
    );
  }
}
