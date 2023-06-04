import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

import 'history/weight_history_page.dart';

const List<String> options = <String>[
  'Milligrams',
  'Grams',
  'Kilograms',
  'Pounds',
  'Tonnes'
];

class WeightPage extends StatefulWidget {
  const WeightPage({super.key});

  @override
  State<WeightPage> createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  final String title = "Mega Converter - Weight";
  TextEditingController textEditingController = TextEditingController();

  String option1 = options[0];
  String option2 = options[2];
  String number = "";
  String result = "";

  Future<void> setResult() async {
    if (double.tryParse(number) != null) {
      double res = 0;
      if (option1 == option2) {
        res = double.parse(number);
      } else if (option1 == 'Milligrams') {
        if (option2 == 'Grams') {
          res = double.parse(number) * 0.001;
        } else if (option2 == 'Kilograms') {
          res = double.parse(number) * 0.000001;
        } else if (option2 == 'Pounds') {
          res = double.parse(number) * 0.0000022;
        } else {
          //Tonnes
          res = double.parse(number) * 0.000000001;
        }
      } else if (option1 == 'Grams') {
        if (option2 == 'Milligrams') {
          res = double.parse(number) * 1000;
        } else if (option2 == 'Kilograms') {
          res = double.parse(number) * 0.001;
        } else if (option2 == 'Pounds') {
          res = double.parse(number) * 0.002204;
        } else {
          //Tonnes
          res = double.parse(number) * 0.000001;
        }
      } else if (option1 == 'Kilograms') {
        if (option2 == 'Milligrams') {
          res = double.parse(number) * 1000000;
        } else if (option2 == 'Grams') {
          res = double.parse(number) * 1000;
        } else if (option2 == 'Pounds') {
          res = double.parse(number) * 2.2046;
        } else {
          //Tonnes
          res = double.parse(number) * 0.001;
        }
      } else if (option1 == 'Pounds') {
        if (option2 == 'Milligrams') {
          res = double.parse(number) * 453592.37;
        } else if (option2 == 'Grams') {
          res = double.parse(number) * 453.59237;
        } else if (option2 == 'Kilograms') {
          res = double.parse(number) * 0.45359;
        } else {
          //Tonnes
          res = double.parse(number) * 0.0004536;
        }
      } else {
        //Tonnes
        if (option2 == 'Milligrams') {
          res = double.parse(number) * 1000000000;
        } else if (option2 == 'Grams') {
          res = double.parse(number) * 1000000;
        } else if (option2 == 'Kilograms') {
          res = double.parse(number) * 1000;
        } else {
          //Pounds
          res = double.parse(number) * 2204.6226;
        }
      }
      setState(() {
        result = res.toStringAsFixed(6);
        if (res >= pow(10, 10)) {
          result = res.toStringAsExponential(4);
        }
      });
      if (option1 != option2) {
        await File('lib/history/weightHistory.txt').writeAsString(
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
                          isExpanded: true,
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.black),
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
                              child:
                                  Text(value, overflow: TextOverflow.visible),
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
                          isExpanded: true,
                          style: const TextStyle(
                              overflow: TextOverflow.fade, color: Colors.black),
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
                              child:
                                  Text(value, overflow: TextOverflow.visible),
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
                  builder: (context) => const WeightHistoryPage(),
                ));
          }),
    );
  }
}
