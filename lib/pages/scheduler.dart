import 'package:flutter/material.dart';
import 'package:iwbf/data/colors.dart';

var weekNumber = 1;

class Scheduler extends StatefulWidget {

  final courseType;

  Scheduler({this.courseType}){
    weekNumber = 1;
  }

  @override
  SchedulerState createState() {
    return new SchedulerState();
  }
}

class SchedulerState extends State<Scheduler> {

  @override
  Widget build(BuildContext context) {

    var daysCardList = cardsListForDays(context: context , weekNumber: weekNumber);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Text(
          widget.courseType,
        ),
        centerTitle: true,
      ),
      body: Material(
        child: Container(
          child: Row(
            children: <Widget>[



              Expanded(
                child: Container(
                  color: Colors.white30,
                  child: Column(

                    children: cardsListForWeek(context,weekNumber),
                    mainAxisAlignment: MainAxisAlignment.center,

                  ),
                ),
                flex: 1,
              ),



              Expanded(
                child: Container(
                  color: Colors.yellow,
                  child: ListView(

                    children: daysCardList

                  ),
                ),
                flex: 3,
              ),


            ],
          ),
        ),
      ),
    );
  }

  List<Widget> cardsListForWeek(context,selectedWeek){
    List<Widget> cards = [];

    for (int i = 1; i < 6 ; i ++){
      cards.add(cardForWeek(context, i,selected: (selectedWeek == i) ? true : false));
    }

    return cards;
  }

  void recalculateDaysCardList(context,weekSelected){
    setState(() {
      weekNumber = weekSelected;
    });
  }

  Widget cardForWeek(context,weekNumber,{selected}){
    return Container(
      color: (selected)?Colors.yellow:Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),

          child: InkWell(
            child: Container(
              height: 75.0,
              child: Center(
                child: Text("Week $weekNumber"),
              ),
            ),
            onTap: (){
              recalculateDaysCardList(context,weekNumber);
            },
          ),


        ),
      ),
    );
  }


  List<Widget> cardsListForDays({context, weekNumber}){
    List<Widget> cards = [];


    final startingDay =  (weekNumber == 1) ? 1 : (weekNumber - 1) * 7;
    
    print("starting day is $startingDay");
    
    for (int i = startingDay; i <  startingDay + 7 && i < 32 ; i ++){
      cards.add(cardForDay(context, i));
    }


    return cards;
  }


  Widget cardForDay(context,dayNumber){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)
        ),
        child: InkWell(
          child: Container(
            height: 100.0,
            child: Center(
              child: Text("Day $dayNumber"),
            ),
          ),
          onTap: (){

          },
        ),
      ),
    );
  }

}

