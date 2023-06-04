import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

import 'history/length_history_page.dart';

const List<String> options = <String>[
  'Millimeters',
  'Centimeters',
  'Meters',
  'Kilometers',
  'Inches',
  'Feet',
  'Yards',
  'Miles',
  'Nautical Miles'
];

class LengthPage extends StatefulWidget {
  const LengthPage({super.key});

  @override
  State<LengthPage> createState() => _LengthPageState();
}

class _LengthPageState extends State<LengthPage> {
  final String title = "Mega Converter - Length";
  TextEditingController textEditingController = TextEditingController();

  String option1 = options[3];
  String option2 = options[5];
  String number = "";
  String result = "";

  Future<void> setResult() async {
    if (double.tryParse(number) != null) {
      double res = 0;
      if (option1 == option2) {
        res = double.parse(number);
      } else if (option1 == 'Millimeters') {
        if (option2 == 'Centimeters') {
          res = double.parse(number) * 0.1;
        } else if (option2 == 'Meters') {
          res = double.parse(number) * 0.001;
        } else if (option2 == 'Kilometers') {
          res = double.parse(number) * 0.000001;
        } else if (option2 == 'Inches') {
          res = double.parse(number) * 0.03937;
        } else if (option2 == 'Feet') {
          res = double.parse(number) * 0.003281;
        } else if (option2 == 'Yards') {
          res = double.parse(number) * 0.001094;
        } else if (option2 == 'Miles') {
          res = double.parse(number) * 0.0000006213;
        } else {
          //Nautical Miles
          res = double.parse(number) * 0.000000549;
        }
      } else if (option1 == 'Centimeters') {
        if (option2 == 'Millimeters') {
          res = double.parse(number) * 10;
        } else if (option2 == 'Meters') {
          res = double.parse(number) * 0.01;
        } else if (option2 == 'Kilometers') {
          res = double.parse(number) * 0.00001;
        } else if (option2 == 'Inches') {
          res = double.parse(number) * 0.393701;
        } else if (option2 == 'Feet') {
          res = double.parse(number) * 0.032808;
        } else if (option2 == 'Yards') {
          res = double.parse(number) * 0.010936;
        } else if (option2 == 'Miles') {
          res = double.parse(number) * 0.000006;
        } else {
          //Nautical Miles
          res = double.parse(number) * 0.0000055;
        }
      } else if (option1 == 'Meters') {
        if (option2 == 'Millimeters') {
          res = double.parse(number) * 1000;
        } else if (option2 == 'Centimeters') {
          res = double.parse(number) * 100;
        } else if (option2 == 'Kilometers') {
          res = double.parse(number) * 0.1;
        } else if (option2 == 'Inches') {
          res = double.parse(number) * 39.37008;
        } else if (option2 == 'Feet') {
          res = double.parse(number) * 3.28084;
        } else if (option2 == 'Yards') {
          res = double.parse(number) * 1.093613;
        } else if (option2 == 'Miles') {
          res = double.parse(number) * 0.000621;
        } else {
          //Nautical Miles
          res = double.parse(number) * 0.00054;
        }
      } else if (option1 == 'Kilometers') {
        if (option2 == 'Millimeters') {
          res = double.parse(number) * 1000000;
        } else if (option2 == 'Centimeters') {
          res = double.parse(number) * 100000;
        } else if (option2 == 'Meters') {
          res = double.parse(number) * 1000;
        } else if (option2 == 'Inches') {
          res = double.parse(number) * 39370.08;
        } else if (option2 == 'Feet') {
          res = double.parse(number) * 3280.84;
        } else if (option2 == 'Yards') {
          res = double.parse(number) * 1093.613;
        } else if (option2 == 'Miles') {
          res = double.parse(number) * 0.621371;
        } else {
          //Nautical Miles
          res = double.parse(number) * 0.539957;
        }
      } else if (option1 == 'Inches') {
        if (option2 == 'Millimeters') {
          res = double.parse(number) * 25.4;
        } else if (option2 == 'Centimeters') {
          res = double.parse(number) * 2.54;
        } else if (option2 == 'Meters') {
          res = double.parse(number) * 0.0254;
        } else if (option2 == 'Kilometers') {
          res = double.parse(number) * 0.0000254;
        } else if (option2 == 'Feet') {
          res = double.parse(number) * 0.08333;
        } else if (option2 == 'Yards') {
          res = double.parse(number) * 0.027778;
        } else if (option2 == 'Miles') {
          res = double.parse(number) * 0.000016;
        } else {
          //Nautical Miles
          res = double.parse(number) * 0.000014;
        }
      } else if (option1 == 'Feet') {
        if (option2 == 'Millimeters') {
          res = double.parse(number) * 304.8;
        } else if (option2 == 'Centimeters') {
          res = double.parse(number) * 30.48;
        } else if (option2 == 'Meters') {
          res = double.parse(number) * 0.3048;
        } else if (option2 == 'Kilometers') {
          res = double.parse(number) * 0.000305;
        } else if (option2 == 'Inches') {
          res = double.parse(number) * 12;
        } else if (option2 == 'Yards') {
          res = double.parse(number) * 0.33333;
        } else if (option2 == 'Miles') {
          res = double.parse(number) * 0.000189;
        } else {
          //Nautical Miles
          res = double.parse(number) * 0.000165;
        }
      } else if (option1 == 'Yards') {
        if (option2 == 'Millimeters') {
          res = double.parse(number) * 914.4;
        } else if (option2 == 'Centimeters') {
          res = double.parse(number) * 91.44;
        } else if (option2 == 'Meters') {
          res = double.parse(number) * 0.9144;
        } else if (option2 == 'Kilometers') {
          res = double.parse(number) * 0.000914;
        } else if (option2 == 'Inches') {
          res = double.parse(number) * 36;
        } else if (option2 == 'Feet') {
          res = double.parse(number) * 3;
        } else if (option2 == 'Miles') {
          res = double.parse(number) * 0.000568;
        } else {
          //Nautical Miles
          res = double.parse(number) * 0.000494;
        }
      } else if (option1 == 'Miles') {
        if (option2 == 'Millimeters') {
          res = double.parse(number) * 1609344;
        } else if (option2 == 'Centimeters') {
          res = double.parse(number) * 160934.4;
        } else if (option2 == 'Meters') {
          res = double.parse(number) * 1609.344;
        } else if (option2 == 'Kilometers') {
          res = double.parse(number) * 1.609344;
        } else if (option2 == 'Inches') {
          res = double.parse(number) * 63360;
        } else if (option2 == 'Feet') {
          res = double.parse(number) * 5280;
        } else if (option2 == 'Yards') {
          res = double.parse(number) * 1760;
        } else {
          //Nautical Miles
          res = double.parse(number) * 0.86897;
        }
      } else if (option1 == 'Nautical Miles') {
        if (option2 == 'Millimeters') {
          res = double.parse(number) * 1852000;
        } else if (option2 == 'Centimeters') {
          res = double.parse(number) * 185200;
        } else if (option2 == 'Meters') {
          res = double.parse(number) * 1852;
        } else if (option2 == 'Kilometers') {
          res = double.parse(number) * 1.852;
        } else if (option2 == 'Inches') {
          res = double.parse(number) * 72913.39;
        } else if (option2 == 'Feet') {
          res = double.parse(number) * 6076.115;
        } else if (option2 == 'Yards') {
          res = double.parse(number) * 2025.372;
        } else {
          //miles
          res = double.parse(number) * 1.15078;
        }
      }
      setState(() {
        result = res.toStringAsFixed(6);
        if (res >= pow(10, 10)) {
          result = res.toStringAsExponential(4);
        }
      });
      if (option1 != option2) {
        await File('lib/history/lengthHistory.txt').writeAsString(
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
                  builder: (context) => const LengthHistoryPage(),
                ));
          }),
    );
  }
}
