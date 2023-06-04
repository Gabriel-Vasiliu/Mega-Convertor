import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

import 'history/data_history_page.dart';

const List<String> options = <String>[
  'Bits',
  'Bytes',
  'Kilobits',
  'Kilobytes',
  'Megabits',
  'Megabytes',
  'Gigabits',
  'Gigabytes',
  'Terabits',
  'Terabytes',
  'Pentabits',
  'Pentabytes'
];

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  final String title = "Mega Converter - Data";
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
      } else if (option1 == 'Bits') {
        if (option2 == 'Bytes') {
          res = double.parse(number) * 0.125;
        } else if (option2 == 'Kilobits') {
          res = double.parse(number) * 0.001;
        } else if (option2 == 'Kilobytes') {
          res = double.parse(number) * 0.000125;
        } else if (option2 == 'Megabits') {
          res = double.parse(number) * 0.000001;
        } else if (option2 == 'Megabytes') {
          res = double.parse(number) * 0.000000125;
        } else if (option2 == 'Gigabits') {
          res = double.parse(number) * 0.000000001;
        } else if (option2 == 'Gigabytes') {
          res = double.parse(number) * 0.000000000125;
        } else if (option2 == 'Terabits') {
          res = double.parse(number) * 0.000000000001;
        } else if (option2 == 'Terabytes') {
          res = double.parse(number) * 0.000000000000125;
        } else if (option2 == 'Pentabytes') {
          res = double.parse(number) * 0.000001; //???????
        } else {
          //pentabits
          res = double.parse(number) * 0.000000000000386; //?????
        }
      } else if (option1 == 'Bytes') {
        if (option2 == 'Bits') {
          res = double.parse(number) * 8;
        } else if (option2 == 'Kilobits') {
          res = double.parse(number) * 0.008;
        } else if (option2 == 'Kilobytes') {
          res = double.parse(number) * 0.001;
        } else if (option2 == 'Megabits') {
          res = double.parse(number) * 0.000008;
        } else if (option2 == 'Megabytes') {
          res = double.parse(number) * 0.000001;
        } else if (option2 == 'Gigabits') {
          res = double.parse(number) * 0.000000008;
        } else if (option2 == 'Gigabytes') {
          res = double.parse(number) * 0.000000001;
        } else if (option2 == 'Terabits') {
          res = double.parse(number) * 0.000000000008;
        } else if (option2 == 'Terabytes') {
          res = double.parse(number) * 0.000000000001;
        } else if (option2 == 'Pentabytes') {
          res = double.parse(number) * 0; //?????????????????
        } else {
          //pentabits
          res = double.parse(number) * 0; //?????????????????
        }
      } else if (option1 == 'Kilobits') {
        if (option2 == 'Bytes') {
          res = double.parse(number) * 125;
        } else if (option2 == 'Bits') {
          res = double.parse(number) * 1000;
        } else if (option2 == 'Kilobytes') {
          res = double.parse(number) * 0.125;
        } else if (option2 == 'Megabits') {
          res = double.parse(number) * 0.001;
        } else if (option2 == 'Megabytes') {
          res = double.parse(number) * 0.000125;
        } else if (option2 == 'Gigabits') {
          res = double.parse(number) * 0.000001;
        } else if (option2 == 'Gigabytes') {
          res = double.parse(number) * 0.000000125;
        } else if (option2 == 'Terabits') {
          res = double.parse(number) * 0.000000001;
        } else if (option2 == 'Terabytes') {
          res = double.parse(number) * 0.000000000125;
        } else if (option2 == 'Pentabytes') {
          res = double.parse(number) * 0.000001; //???????
        } else {
          //pentabits
          res = double.parse(number) * 0.000000000000386; //?????
        }
      } else if (option1 == 'Kilobytes') {
        if (option2 == 'Bits') {
          res = double.parse(number) * 8000;
        } else if (option2 == 'Kilobits') {
          res = double.parse(number) * 8;
        } else if (option2 == 'Bytes') {
          res = double.parse(number) * 1000;
        } else if (option2 == 'Megabits') {
          res = double.parse(number) * 0.008;
        } else if (option2 == 'Megabytes') {
          res = double.parse(number) * 0.001;
        } else if (option2 == 'Gigabits') {
          res = double.parse(number) * 0.000008;
        } else if (option2 == 'Gigabytes') {
          res = double.parse(number) * 0.000001;
        } else if (option2 == 'Terabits') {
          res = double.parse(number) * 0.000000008;
        } else if (option2 == 'Terabytes') {
          res = double.parse(number) * 0.000000001;
        } else if (option2 == 'Pentabytes') {
          res = double.parse(number) * 0; //?????????????????
        } else {
          //pentabits
          res = double.parse(number) * 0; //?????????????????
        }
      } else if (option1 == 'Megabits') {
        if (option2 == 'Bytes') {
          res = double.parse(number) * 125000;
        } else if (option2 == 'Bits') {
          res = double.parse(number) * 1000000;
        } else if (option2 == 'Kilobytes') {
          res = double.parse(number) * 125;
        } else if (option2 == 'Kilobits') {
          res = double.parse(number) * 1000;
        } else if (option2 == 'Megabytes') {
          res = double.parse(number) * 0.125;
        } else if (option2 == 'Gigabits') {
          res = double.parse(number) * 0.001;
        } else if (option2 == 'Gigabytes') {
          res = double.parse(number) * 0.000125;
        } else if (option2 == 'Terabits') {
          res = double.parse(number) * 0.000001;
        } else if (option2 == 'Terabytes') {
          res = double.parse(number) * 0.000000125;
        } else if (option2 == 'Pentabytes') {
          res = double.parse(number) * 0.000000000125;
        } else {
          //pentabits
          res = double.parse(number) * 0.000000001;
        }
      } else if (option1 == 'Megabytes') {
        if (option2 == 'Bits') {
          res = double.parse(number) * 8000000;
        } else if (option2 == 'Kilobits') {
          res = double.parse(number) * 8000;
        } else if (option2 == 'Bytes') {
          res = double.parse(number) * 1000000;
        } else if (option2 == 'Megabits') {
          res = double.parse(number) * 8;
        } else if (option2 == 'Kilobytes') {
          res = double.parse(number) * 1000;
        } else if (option2 == 'Gigabits') {
          res = double.parse(number) * 0.008;
        } else if (option2 == 'Gigabytes') {
          res = double.parse(number) * 0.001;
        } else if (option2 == 'Terabits') {
          res = double.parse(number) * 0.000008;
        } else if (option2 == 'Terabytes') {
          res = double.parse(number) * 0.000001;
        } else if (option2 == 'Pentabytes') {
          res = double.parse(number) * 0.000000001;
        } else {
          //pentabits
          res = double.parse(number) * 0.000000008;
        }
      } else if (option1 == 'Gigabits') {
        if (option2 == 'Bytes') {
          res = double.parse(number) * 125000000;
        } else if (option2 == 'Bits') {
          res = double.parse(number) * 1000000000;
        } else if (option2 == 'Kilobytes') {
          res = double.parse(number) * 125000;
        } else if (option2 == 'Kilobits') {
          res = double.parse(number) * 1000000;
        } else if (option2 == 'Megabytes') {
          res = double.parse(number) * 125;
        } else if (option2 == 'Megabits') {
          res = double.parse(number) * 1000;
        } else if (option2 == 'Gigabytes') {
          res = double.parse(number) * 0.125;
        } else if (option2 == 'Terabits') {
          res = double.parse(number) * 0.001;
        } else if (option2 == 'Terabytes') {
          res = double.parse(number) * 0.000125;
        } else if (option2 == 'Pentabytes') {
          res = double.parse(number) * 0.000000125;
        } else {
          //pentabits
          res = double.parse(number) * 0.000001;
        }
      } else if (option1 == 'Gigabytes') {
        if (option2 == 'Bits') {
          res = double.parse(number) * 8000000000;
        } else if (option2 == 'Kilobits') {
          res = double.parse(number) * 8000000;
        } else if (option2 == 'Bytes') {
          res = double.parse(number) * 1000000000;
        } else if (option2 == 'Megabits') {
          res = double.parse(number) * 8000;
        } else if (option2 == 'Kilobytes') {
          res = double.parse(number) * 1000000;
        } else if (option2 == 'Gigabits') {
          res = double.parse(number) * 8;
        } else if (option2 == 'Megabytes') {
          res = double.parse(number) * 1000;
        } else if (option2 == 'Terabits') {
          res = double.parse(number) * 0.008;
        } else if (option2 == 'Terabytes') {
          res = double.parse(number) * 0.001;
        } else if (option2 == 'Pentabytes') {
          res = double.parse(number) * 0.000001;
        } else {
          //pentabits
          res = double.parse(number) * 0.000008;
        }
      } else if (option1 == 'Terabits') {
        if (option2 == 'Bytes') {
          res = double.parse(number) * 125000000000;
        } else if (option2 == 'Bits') {
          res = double.parse(number) * 1000000000000;
        } else if (option2 == 'Kilobytes') {
          res = double.parse(number) * 125000000;
        } else if (option2 == 'Kilobits') {
          res = double.parse(number) * 1000000000;
        } else if (option2 == 'Megabytes') {
          res = double.parse(number) * 125000;
        } else if (option2 == 'Megabits') {
          res = double.parse(number) * 1000000;
        } else if (option2 == 'Gigabytes') {
          res = double.parse(number) * 125;
        } else if (option2 == 'Gigabits') {
          res = double.parse(number) * 1000;
        } else if (option2 == 'Terabytes') {
          res = double.parse(number) * 0.125;
        } else if (option2 == 'Pentabytes') {
          res = double.parse(number) * 0.000125;
        } else {
          //pentabits
          res = double.parse(number) * 0.001;
        }
      } else if (option1 == 'Terabytes') {
        if (option2 == 'Bits') {
          res = double.parse(number) * 8000000000000;
        } else if (option2 == 'Kilobits') {
          res = double.parse(number) * 8000000000;
        } else if (option2 == 'Bytes') {
          res = double.parse(number) * 1000000000000;
        } else if (option2 == 'Megabits') {
          res = double.parse(number) * 8000000;
        } else if (option2 == 'Kilobytes') {
          res = double.parse(number) * 1000000000;
        } else if (option2 == 'Gigabits') {
          res = double.parse(number) * 8000;
        } else if (option2 == 'Megabytes') {
          res = double.parse(number) * 1000000;
        } else if (option2 == 'Terabits') {
          res = double.parse(number) * 8;
        } else if (option2 == 'Gigabytes') {
          res = double.parse(number) * 1000;
        } else if (option2 == 'Pentabytes') {
          res = double.parse(number) * 0.001;
        } else {
          //pentabits
          res = double.parse(number) * 0.008;
        }
      } else if (option1 == 'Pentabits') {
        if (option2 == 'Bytes') {
          res = double.parse(number) * 125000000000000;
        } else if (option2 == 'Bits') {
          res = double.parse(number) * 1000000000000000;
        } else if (option2 == 'Kilobytes') {
          res = double.parse(number) * 125000000000;
        } else if (option2 == 'Kilobits') {
          res = double.parse(number) * 1000000000000;
        } else if (option2 == 'Megabytes') {
          res = double.parse(number) * 125000000;
        } else if (option2 == 'Megabits') {
          res = double.parse(number) * 1000000000;
        } else if (option2 == 'Gigabytes') {
          res = double.parse(number) * 125000;
        } else if (option2 == 'Gigabits') {
          res = double.parse(number) * 1000000;
        } else if (option2 == 'Terabytes') {
          res = double.parse(number) * 125;
        } else if (option2 == 'Pentabytes') {
          res = double.parse(number) * 0.125;
        } else {
          //terabits
          res = double.parse(number) * 1000;
        }
      } else if (option1 == 'Pentabytes') {
        if (option2 == 'Bits') {
          res = double.parse(number) * 8000000000000000;
        } else if (option2 == 'Kilobits') {
          res = double.parse(number) * 8000000000000;
        } else if (option2 == 'Bytes') {
          res = double.parse(number) * 1000000000000000;
        } else if (option2 == 'Megabits') {
          res = double.parse(number) * 8000000000;
        } else if (option2 == 'Kilobytes') {
          res = double.parse(number) * 1000000000000;
        } else if (option2 == 'Gigabits') {
          res = double.parse(number) * 8000000;
        } else if (option2 == 'Megabytes') {
          res = double.parse(number) * 1000000000;
        } else if (option2 == 'Terabits') {
          res = double.parse(number) * 8000;
        } else if (option2 == 'Gigabytes') {
          res = double.parse(number) * 1000000;
        } else if (option2 == 'Terabytes') {
          res = double.parse(number) * 1000;
        } else {
          //pentabits
          res = double.parse(number) * 8;
        }
      }
      setState(() {
        result = res.toStringAsFixed(6);
        if (res >= pow(10, 10)) {
          result = res.toStringAsExponential(4);
        }
      });

      if (option1 != option2) {
        await File('lib/history/dataHistory.txt').writeAsString(
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
                  builder: (context) => const DataHistoryPage(),
                ));
          }),
    );
  }
}
