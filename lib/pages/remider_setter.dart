import 'package:flutter/material.dart';
import 'package:iwbf/data/colors.dart';
import 'package:iwbf/functions/painters.dart';

class ReminderSetter extends StatefulWidget {
  @override
  _ReminderSetterState createState() => _ReminderSetterState();
}

class _ReminderSetterState extends State<ReminderSetter> {

  final clockRadius = 150.0;
  final hourHandLength = 120.0;
  final hourMinuteLength = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Container(
          child: Column(
            children: <Widget>[
              Center(
                child: Stack(
                  children: <Widget>[
                    Container(

                      height: 300.0,
                      width: 300.0,
                      child: CustomPaint(painter: ClockPainter(
                        circleRadius: clockRadius,
                        centerPoint: Offset(150,150)
                      ),),

                    ),

                    Container(

                      height: 300.0,
                      width: 300.0,
                      child: Stack(
                        children: <Widget>[

                          GestureDetector(
                            child: CustomPaint(painter: ClockHandsPainter(
                                radius: clockRadius - 40,
                                degree: 0,
                                centerPoint: Offset(150,150)
                              ),
                            ),
                          ),


                          GestureDetector(
                            child: CustomPaint(painter: ClockHandsPainter(
                                radius: clockRadius - 60,
                                degree: 6,
                                centerPoint: Offset(150,150)
                              ),
                            ),

                            onPanStart: (DragStartDetails details){
                              print("Drag started ${details.globalPosition}");
                            },
                          ),



                        ],
                      ),

                    ),


                  ],
                ),
              )
            ],
          ),
        ),
      ),

      appBar: AppBar(
        backgroundColor: primary,
        title: Text("Set A Reminder"),
        centerTitle: true,
      ),


    );
  }
}
