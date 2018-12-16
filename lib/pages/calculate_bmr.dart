import 'package:flutter/material.dart';
import 'package:iwbf/data/colors.dart';

class CalculateBmr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(),
      appBar: AppBar(
        backgroundColor: primary,
        title: Text("Calculate Bmi"),
        centerTitle: true,
      ),
    );
  }
}
