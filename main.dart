import 'package:flutter/material.dart';
import 'home_page.dart';
import 'currency_page.dart';
import 'angle_page.dart';
import 'area_page.dart';
import 'volume_page.dart';
import 'temperature_page.dart';
import 'time_page.dart';
import 'length_page.dart';
import 'weight_page.dart';
import 'energy_page.dart';
import 'speed_page.dart';
import 'data_page.dart';
import 'power_page.dart';
import 'pressure_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String title = 'Mega Converter';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(title: title),
        '/currency': (context) => const CurrencyPage(),
        '/volume': (context) => const VolumePage(),
        '/length': (context) => const LengthPage(),
        '/weight': (context) => const WeightPage(),
        '/temperature': (context) => const TemperaturePage(),
        '/energy': (context) => const EnergyPage(),
        '/area': (context) => const AreaPage(),
        '/speed': (context) => const SpeedPage(),
        '/time': (context) => const TimePage(),
        '/power': (context) => const PowerPage(),
        '/data': (context) => const DataPage(),
        '/pressure': (context) => const PressurePage(),
        '/angle': (context) => const AnglePage(),
      },
    );
  }
}
