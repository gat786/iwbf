import 'package:flutter/material.dart';
import 'package:iwbf/pages/calculate_bmi.dart';
import 'package:iwbf/pages/calculate_bmr.dart';

import 'package:iwbf/pages/fitness_schemes.dart';
import 'package:iwbf/pages/remider_setter.dart';


import 'package:iwbf/pages/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: HomePage(),

      routes: <String,WidgetBuilder> {
        '/select': (BuildContext context) => FitnessScheme(),
        '/bmi': (BuildContext context) => CalculateBmi(),
        '/bmr': (BuildContext context) => CalculateBmr(),
        '/reminder': (BuildContext context) => ReminderSetter(),
      },

    );
  }
}