import 'package:flutter/material.dart';

import 'package:iwbf/data/colors.dart';

class WeeklySchedule extends StatefulWidget {
  final String title;
  final String appbarImagePath;

  WeeklySchedule(this.title,this.appbarImagePath);

  @override
  _WeeklyScheduleState createState() => _WeeklyScheduleState();
}

class _WeeklyScheduleState extends State<WeeklySchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context,bool innerBoxisScrolled){
          return <Widget>[
            SliverAppBar(
              backgroundColor: primary,
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0
                  ),
                ),
                background: Image.network(
                  widget.appbarImagePath,
                  fit: BoxFit.cover
                ),
              ),
            )
          ];
        },
        body: Material(
          child: ListView(
            children: <Widget>[
              cardWeekly(1, context),
              cardWeekly(2, context),
              cardWeekly(3, context),
              cardWeekly(4, context),
              cardWeekly(5, context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget cardWeekly(weekNumber,context){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 150.0,
    padding: EdgeInsets.all(10.0),
    child: Card(
      child: Text("Week $weekNumber"),
    ),
  );
}