import 'package:flutter/material.dart';
import 'package:iwbf/pages/detailed_day_view.dart';

import 'package:iwbf/pages/fitness_schemes.dart';
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
      },

    );
  }
}