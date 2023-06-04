import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

import 'history/pressure_history_page.dart';

const List<String> options = <String>[
  'Atmospheres',
  'Bars',
  'Kilopascals',
  'Pascals',
  'Millimeters of mercury'
];

class PressurePage extends StatefulWidget {
  const PressurePage({super.key});

  @override
  State<PressurePage> createState() => _PressurePageState();
}

class _PressurePageState extends State<PressurePage> {
  final String title = "Mega Converter - Pressure";
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
      } else if (option1 == 'Atmospheres') {
        if (option2 == 'Bars') {
          res = double.parse(number) * 1.01325;
        } else if (option2 == 'Kilopascals') {
          res = double.parse(number) * 101.325;
        } else if (option2 == 'Pascals') {
          res = double.parse(number) * 101325;
        } else {
          //Millimeters of mercury
          res = double.parse(number) * 760.1275;
        }
      } else if (option1 == 'Bars') {
        if (option2 == 'Atmospheres') {
          res = double.parse(number) * 0.98692;
        } else if (option2 == 'Kilopascals') {
          res = double.parse(number) * 100;
        } else if (option2 == 'Pascals') {
          res = double.parse(number) * 100000;
        } else {
          //Millimeters of mercury
          res = double.parse(number) * 750.1875;
        }
      } else if (option1 == 'Kilopascals') {
        if (option2 == 'Atmospheres') {
          res = double.parse(number) * 0.009869;
        } else if (option2 == 'Bars') {
          res = double.parse(number) * 0.01;
        } else if (option2 == 'Pascals') {
          res = double.parse(number) * 1000;
        } else {
          //Millimeters of mercury
          res = double.parse(number) * 7.50187;
        }
      } else if (option1 == 'Pascals') {
        if (option2 == 'Atmospheres') {
          res = double.parse(number) * 0.0000098;
        } else if (option2 == 'Bars') {
          res = double.parse(number) * 0.00001;
        } else if (option2 == 'Kilopascals') {
          res = double.parse(number) * 0.001;
        } else {
          //Millimeters of mercury
          res = double.parse(number) * 0.007502;
        }
      } else {
        //Millimeters of mercury
        if (option2 == 'Atmospheres') {
          res = double.parse(number) * 0.001316;
        } else if (option2 == 'Bars') {
          res = double.parse(number) * 0.001333;
        } else if (option2 == 'Kilopascals') {
          res = double.parse(number) * 0.1333;
        } else {
          //Pascals
          res = double.parse(number) * 133.3;
        }
      }
      setState(() {
        result = res.toStringAsFixed(6);
        if (res >= pow(10, 10)) {
          result = res.toStringAsExponential(4);
        }
      });
      if (option1 != option2) {
        await File('lib/history/pressureHistory.txt').writeAsString(
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
                  builder: (context) => const PressureHistoryPage(),
                ));
          }),
    );
  }
}
