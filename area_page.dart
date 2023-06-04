import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:io';

import 'history/area_history_page.dart';

const List<String> options = <String>[
  'Square millimeters',
  'Square centimeters',
  'Square meters',
  'Square kilometers',
  'Hectares',
  'Square inches',
  'Square feet',
  'Square yards',
  'Square miles'
];

class AreaPage extends StatefulWidget {
  const AreaPage({super.key});

  @override
  State<AreaPage> createState() => _AreaPageState();
}

class _AreaPageState extends State<AreaPage> {
  final String title = "Mega Converter - Area";
  TextEditingController textEditingController = TextEditingController();

  String option1 = options[2];
  String option2 = options[4];
  String number = "";
  String result = "";

  Future<void> setResult() async {
    if (double.tryParse(number) != null) {
      double res = 0;
      if (option1 == option2) {
        res = double.parse(number);
      } else if (option1 == 'Square millimeters') {
        if (option2 == 'Square centimeters') {
          res = double.parse(number) * 0.01;
        } else if (option2 == 'Square meters') {
          res = double.parse(number) * 0.000001;
        } else if (option2 == 'Square kilometers') {
          res = double.parse(number) * 0.000000000001;
        } else if (option2 == 'Hectares') {
          res = double.parse(number) * 0.0000000001;
        } else if (option2 == 'Square inches') {
          res = double.parse(number) * 0.00155;
        } else if (option2 == 'Square feet') {
          res = double.parse(number) * 0.000011;
        } else if (option2 == 'Square yards') {
          res = double.parse(number) * 0.000001;
        } else {
          res = double.parse(number) * 0.000000000000386;
        }
      } else if (option1 == 'Square centimeters') {
        if (option2 == 'Square millimeters') {
          res = double.parse(number) * 100;
        } else if (option2 == 'Square meters') {
          res = double.parse(number) * 0.0001;
        } else if (option2 == 'Square kilometers') {
          res = double.parse(number) * 0.0000000001;
        } else if (option2 == 'Hectares') {
          res = double.parse(number) * 0.00000001;
        } else if (option2 == 'Square inches') {
          res = double.parse(number) * 0.155;
        } else if (option2 == 'Square feet') {
          res = double.parse(number) * 0.001076;
        } else if (option2 == 'Square yards') {
          res = double.parse(number) * 0.00012;
        } else {
          res = double.parse(number) * 0.00000000003861;
        }
      } else if (option1 == 'Square meters') {
        if (option2 == 'Square centimeters') {
          res = double.parse(number) * 10000;
        } else if (option2 == 'Square millimeters') {
          res = double.parse(number) * 1000000;
        } else if (option2 == 'Square kilometers') {
          res = double.parse(number) * 0.000001;
        } else if (option2 == 'Hectares') {
          res = double.parse(number) * 0.0001;
        } else if (option2 == 'Square inches') {
          res = double.parse(number) * 1550.003;
        } else if (option2 == 'Square feet') {
          res = double.parse(number) * 10.76391;
        } else if (option2 == 'Square yards') {
          res = double.parse(number) * 1.19599;
        } else {
          res = double.parse(number) * 0.000000386102159;
        }
      } else if (option1 == 'Square kilometers') {
        if (option2 == 'Square centimeters') {
          res = double.parse(number) * 10000000000;
        } else if (option2 == 'Square meters') {
          res = double.parse(number) * 1000000;
        } else if (option2 == 'Square millimeters') {
          res = double.parse(number) * 1000000000000;
        } else if (option2 == 'Hectares') {
          res = double.parse(number) * 100;
        } else if (option2 == 'Square inches') {
          res = double.parse(number) * 1550003100;
        } else if (option2 == 'Square feet') {
          res = double.parse(number) * 10763910;
        } else if (option2 == 'Square yards') {
          res = double.parse(number) * 1195990;
        } else {
          res = double.parse(number) * 0.386102;
        }
      } else if (option1 == 'Hectares') {
        if (option2 == 'Square centimeters') {
          res = double.parse(number) * 100000000;
        } else if (option2 == 'Square meters') {
          res = double.parse(number) * 10000;
        } else if (option2 == 'Square kilometers') {
          res = double.parse(number) * 0.01;
        } else if (option2 == 'Square millimeters') {
          res = double.parse(number) * 10000000000;
        } else if (option2 == 'Square inches') {
          res = double.parse(number) * 15500031;
        } else if (option2 == 'Square feet') {
          res = double.parse(number) * 107639.1;
        } else if (option2 == 'Square yards') {
          res = double.parse(number) * 11959.9;
        } else {
          res = double.parse(number) * 0.003861;
        }
      } else if (option1 == 'Square inches') {
        if (option2 == 'Square centimeters') {
          res = double.parse(number) * 6.4516;
        } else if (option2 == 'Square meters') {
          res = double.parse(number) * 0.000645;
        } else if (option2 == 'Square kilometers') {
          res = double.parse(number) * 0.00000000064516;
        } else if (option2 == 'Hectares') {
          res = double.parse(number) * 0.000000064516;
        } else if (option2 == 'Square millimeters') {
          res = double.parse(number) * 645.16;
        } else if (option2 == 'Square feet') {
          res = double.parse(number) * 0.006944;
        } else if (option2 == 'Square yards') {
          res = double.parse(number) * 0.000772;
        } else {
          res = double.parse(number) * 0.000000000249098;
        }
      } else if (option1 == 'Square feet') {
        if (option2 == 'Square centimeters') {
          res = double.parse(number) * 929.0304;
        } else if (option2 == 'Square meters') {
          res = double.parse(number) * 0.092903;
        } else if (option2 == 'Square kilometers') {
          res = double.parse(number) * 0.00000009290304;
        } else if (option2 == 'Hectares') {
          res = double.parse(number) * 0.000009;
        } else if (option2 == 'Square inches') {
          res = double.parse(number) * 144;
        } else if (option2 == 'Square millimeters') {
          res = double.parse(number) * 92903.04;
        } else if (option2 == 'Square yards') {
          res = double.parse(number) * 0.111111;
        } else {
          res = double.parse(number) * 0.000000035870064;
        }
      } else if (option1 == 'Square yards') {
        if (option2 == 'Square centimeters') {
          res = double.parse(number) * 8361.274;
        } else if (option2 == 'Square meters') {
          res = double.parse(number) * 0.836127;
        } else if (option2 == 'Square kilometers') {
          res = double.parse(number) * 0.00000083612736;
        } else if (option2 == 'Hectares') {
          res = double.parse(number) * 0.000084;
        } else if (option2 == 'Square inches') {
          res = double.parse(number) * 1296;
        } else if (option2 == 'Square feet') {
          res = double.parse(number) * 9;
        } else if (option2 == 'Square millimeters') {
          res = double.parse(number) * 836127.4;
        } else {
          res = double.parse(number) * 0.000000322830579;
        }
      } else {
        //miles
        if (option2 == 'Square centimeters') {
          res = double.parse(number) * 25899881103;
        } else if (option2 == 'Square meters') {
          res = double.parse(number) * 2589988;
        } else if (option2 == 'Square kilometers') {
          res = double.parse(number) * 2.589988;
        } else if (option2 == 'Hectares') {
          res = double.parse(number) * 258.9988;
        } else if (option2 == 'Square inches') {
          res = double.parse(number) * 4014489600;
        } else if (option2 == 'Square feet') {
          res = double.parse(number) * 27878400;
        } else if (option2 == 'Square yards') {
          res = double.parse(number) * 3097600;
        } else {
          //milimetri
          res = double.parse(number) * 2589988110336;
        }
      }
      setState(() {
        result = res.toStringAsFixed(6);
        if (res >= pow(10, 10)) {
          result = res.toStringAsExponential(4);
        }
      });
      if (option1 != option2) {
        await File('lib/history/areaHistory.txt').writeAsString(
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
                  builder: (context) => const AreaHistoryPage(),
                ));
          }),
    );
  }
}
