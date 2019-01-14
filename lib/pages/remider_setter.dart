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

  final Offset center = Offset(0,190);

  @override
  bool hitTestSelf(Offset position)=> true;

  selectTime({context,initialDate,firstDate,lastDate,}) async {
    TimeOfDay picked = await showTimePicker(context: context, initialTime: TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Container(
          height: MediaQuery.of(context).size.height,

            child: Container(
              child: FlatButton(
                  onPressed: (){
                    selectTime(context: context,);
                    },
                  child: Text("Select Time")),
            )
//                    CustomPaint(
//                      painter: ClockPainter(
//                        circleRadius: clockRadius,
//                        centerPoint: center
//                      ),
//
//                    ),
//
//                    CustomPaint(
//                      painter: ClockHandsPainter(
//                        centerPoint: center,
//                        radius: clockRadius - 30,
//                        degree: 60,
//                        strokeWidth: 3
//                      ),
//                    ),
//
//
//                    CustomPaint(
//                      painter: ClockHandsPainter(
//                          centerPoint: center,
//                          radius: clockRadius - 50,
//                          degree: 40,
//                          strokeWidth: 3
//                      ),
//                    )


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
