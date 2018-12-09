import 'package:flutter/material.dart';

import 'package:iwbf/pages/fitness_schemes.dart';
import 'package:iwbf/pages/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: HomePage(),

      routes: <String,WidgetBuilder> {
        '/select': (BuildContext context) => FitnessScheme(),
      },

    );
  }
}