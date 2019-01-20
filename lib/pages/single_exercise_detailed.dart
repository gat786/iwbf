import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExerciseDetailed extends StatefulWidget {

  final excerciseName;
  final List<String> steps;
  final repsCount;
  final imageUrl;
  final counterNumber;

  const ExerciseDetailed(
      {
        Key key,
        this.excerciseName,
        this.steps,
        this.repsCount,
        this.imageUrl,
        this.counterNumber
      }
      ) : super(key: key);

  @override
  _ExerciseDetailedState createState() => _ExerciseDetailedState();
}

class _ExerciseDetailedState extends State<ExerciseDetailed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: ListView(
          children: <Widget>[

            Stack(
              children :[

                Hero(
                  tag: "exerciseImage${widget.counterNumber}",
                  child: Container(
                    height: MediaQuery.of(context).size.height/2,

                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.imageUrl),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ),

                Container(
                  child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: ()
                      {
                        Navigator.of(context).pop();
                      }
                  ),
                )
              ]
            ),
            
             Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Exercise Name",
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
            ),


            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Steps: -"),
              ),
            ),

            Container(
              child: Column(
                children: stepsBuilder(
                    [
                      "1). Step detailed Explanation",
                      "2). Step detailed Explanation",
                      "3). Step detailed Explanation"
                    ]
                ),
              ),
            ),
            
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Reps: - $repCount"),
              ),
            )


          ],
        ),
      ),
    );
  }

  var repCount = 3;
  List<Container> stepsBuilder(List<String> steps){

    List<Container> stepsList = [];

    for (var every in steps){
      stepsList.add(
        new Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              every,
            ),
          ),
          width: double.infinity,
        )
      );
    }

    return stepsList;

  }
}
