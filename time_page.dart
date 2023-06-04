import 'dart:io';

import 'package:flutter/material.dart';

import 'history/time_history_page.dart';

const List<String> options = <String>[
  'Seconds',
  'Minutes',
  'Hours',
  'Days',
  'Weeks',
  'Years'
];

class TimePage extends StatefulWidget {
  const TimePage({super.key});

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  final String title = "Mega Converter - Time";
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
      } else if (option1 == 'Seconds') {
        if (option2 == 'Minutes') {
          res = double.parse(number) * 0.01666;
        } else if (option2 == 'Hours') {
          res = double.parse(number) * 0.00027777;
        } else if (option2 == 'Days') {
          res = double.parse(number) * 0.0000157;
        } else if (option2 == 'Weeks') {
          res = double.parse(number) * 0.00000165;
        } else {
          //Years
          res = double.parse(number) * 0.000000031;
        }
      } else if (option1 == 'Minutes') {
        if (option2 == 'Seconds') {
          res = double.parse(number) * 60;
        } else if (option2 == 'Hours') {
          res = double.parse(number) * 0.01666;
        } else if (option2 == 'Days') {
          res = double.parse(number) * 0.0006944;
        } else if (option2 == 'Weeks') {
          res = double.parse(number) * 0.0000992;
        } else {
          //Years
          res = double.parse(number) * 0.0000019;
        }
      } else if (option1 == 'Hours') {
        if (option2 == 'Seconds') {
          res = double.parse(number) * 3600;
        } else if (option2 == 'Minutes') {
          res = double.parse(number) * 60;
        } else if (option2 == 'Days') {
          res = double.parse(number) * 0.04166;
        } else if (option2 == 'Weeks') {
          res = double.parse(number) * 0.00595;
        } else {
          //Years
          res = double.parse(number) * 0.000114;
        }
      } else if (option1 == 'Days') {
        if (option2 == 'Seconds') {
          res = double.parse(number) * 86400;
        } else if (option2 == 'Minutes') {
          res = double.parse(number) * 1440;
        } else if (option2 == 'Hours') {
          res = double.parse(number) * 24;
        } else if (option2 == 'Weeks') {
          res = double.parse(number) * 0.14285;
        } else {
          //Years
          res = double.parse(number) * 0.002738;
        }
      } else if (option1 == 'Weeks') {
        if (option2 == 'Seconds') {
          res = double.parse(number) * 604800;
        } else if (option2 == 'Minutes') {
          res = double.parse(number) * 10080;
        } else if (option2 == 'Hours') {
          res = double.parse(number) * 168;
        } else if (option2 == 'Days') {
          res = double.parse(number) * 7;
        } else {
          //Years
          res = double.parse(number) * 0.019165;
        }
      } else {
        //Years
        if (option2 == 'Seconds') {
          res = double.parse(number) * 31556926;
        } else if (option2 == 'Minutes') {
          res = double.parse(number) * 525948.766;
        } else if (option2 == 'Hours') {
          res = double.parse(number) * 8765.81277;
        } else if (option2 == 'Days') {
          res = double.parse(number) * 365.242;
        } else {
          //Weeks
          res = double.parse(number) * 52.1774;
        }
      }
      setState(() {
        result = res.toString();
      });
      if (option1 != option2) {
        await File('lib/history/timeHistory.txt').writeAsString(
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
                  builder: (context) => const TimeHistoryPage(),
                ));
          }),
    );
  }
}
