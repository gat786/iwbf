import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:iwbf/data/colors.dart';
import 'package:iwbf/data/exercise.dart';
import 'package:iwbf/pages/single_exercise_detailed.dart';

class DetailedView extends StatefulWidget {

  final dayNumber;
  final courseName;


  DetailedView({this.dayNumber,this.courseName});

  @override
  DetailedViewState createState() {
    return new DetailedViewState();
  }
}

var playingAudio = false;

class DetailedViewState extends State<DetailedView> {

  bool isLoaded = false;
  bool isRestDay = false;
  List<Exercise> objects = List();

  DetailedViewState(){
    isLoaded = false;
    isRestDay = false;
    getData();
    objects.clear();
  }

  final imgurl1="https://res.cloudinary.com/dtldj8hpa/image/upload/c_scale,w_889/v1544416676/iwillbefit/emma-simpson-153970-unsplash.jpg";

  final imgurl2="https://res.cloudinary.com/dtldj8hpa/image/upload/c_scale,w_936/v1544416190/iwillbefit/jogging.jpg";

  final imgurl3="https://res.cloudinary.com/dtldj8hpa/image/upload/c_scale,w_1463/v1544416296/iwillbefit/meghan-holmes-1057329-unsplash.jpg";

  List<Widget> cards =[];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: primary,
        centerTitle: true,
        title: Text("${widget.courseName}: Day ${widget.dayNumber}"),
      ),




      body: Stack(
        children: <Widget>[

          Material(
            child: ListView(
              children: <Widget>[

              ] + cards,
            ),
          ),

          (isLoaded)?Container():Container(
            color: Colors.black54,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  SizedBox(
                    child: CircularProgressIndicator(),
                    height: 100.0,
                    width: 100.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Loading",
                      style: TextStyle(color: Colors.white,fontSize: 24.0),
                    ),
                  )
                ],
              ),
            ),
          ),

          (isRestDay)?Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Material(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/icons/relax.png"),
                    height: 150.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Relax! Today is your rest day.",
                        style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                ],
              ),
              ),
            ):Container()



        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: IconButton(
          icon: (playingAudio)?Icon(Icons.pause):Icon(Icons.play_arrow),
          onPressed: ()
          {
            this.setState((){
              playingAudio = !playingAudio;
            });
          },
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        elevation: 32.0,
        color: Colors.amber,
      ),

    );
  }

  Widget exerciseCard({assetPath,exerciseName,exerciseDetails,context,counter}){
    return InkWell(
      onTap: (){

        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (BuildContext context) => ExerciseDetailed(
                  counterNumber: counter,
                  imageUrl: assetPath,
                )
            )
        );

      },

      child: Container(
        height: 120.0,
        child: Row(
          children: <Widget>[

            Hero(
              tag: "exerciseImage$counter",
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow,
                      image: DecorationImage(
                        image: (assetPath!="")
                            ? NetworkImage(assetPath)
                            : NetworkImage(imgurl1),
                        fit: BoxFit.cover
                      )
                    ),

                  ),
                ),

                width: 120.0,

              ),
            ),


            Container(
              child: Container(

                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.only(top: 16.0,left: 8.0),
                      child: Text(
                        exerciseName,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top:8.0,right: 8.0,left: 8.0,bottom: 16.0),
                      child: Text(
                        exerciseDetails,
                        style: TextStyle(
                          color: Colors.black54
                        ),
                        softWrap: true,
                        maxLines: 3,
                      ),
                    ),

                  ],
                ),

                width: MediaQuery.of(context).size.width - 150,

              ),

            ),

          ],
        ),
      ),
    );
  }



  getData() async {
    List listOfRequiredExercises;
    await Firestore.instance.collection('schedules').document('intermediate').get().then((data){
        var requiredday = (widget.dayNumber%5==0)?5:widget.dayNumber%5;
        listOfRequiredExercises = data['day$requiredday'];
      }
    );

    objects.clear();


    if(listOfRequiredExercises.runtimeType != String) {

    var exercises = await Firestore.instance.collection('exercises').getDocuments();

    List exercisesOfTheDay;

    for (var item in listOfRequiredExercises) {
      var data = exercises.documents.singleWhere((element) => element.documentID==item['key']);
      var object = Exercise(name: data['name'],
        definition: data['definition'],
        steps: data['steps']
      );
      exercisesOfTheDay.add(object);
      objects.add(object);
    }



//    .then((data){
//    var listExercises = data.documents;
//
//    for (var required in requiredData) {
//    print(required);
//    }
//
//    var exerMap =listExercises.asMap();
//    print(exerMap[int.parse(requiredData[0]['key'])].data);
//
//    List<Exercise> exercises = new List();
//
//    for (var o in requiredData) {
//    print(int.parse(o['key']).toString() + " : " + listExercises.elementAt(int.parse(o['key']) - 1).data.toString());
//
//    var exercise = listExercises.elementAt(int.parse(o['key']) - 1).data;
//    var object = Exercise(name: exercise['name'],
//    definition: exercise['definition'],
//    steps: exercise['steps'],
//    sides: o['sides'],
//    duration: int.parse((o['duration']!=null)?o['duration']:0),
//    reps: int.parse((o['reps']!=null)?o['reps']:0));
//    }
//
//    }


      setState(() {
        isLoaded = true;
        buildCards(objects);
      });
    }
    else{
      setState(() {
        isLoaded = true;
        isRestDay = true;
      });
    }

  }

  buildCards(List<Exercise> data){

    for (int i = 1; i <= data.length; i++) {
      Widget card = exerciseCard(
          assetPath: imgurl2,
          exerciseName: data[i - 1].name,
          exerciseDetails: (data[i - 1].definition == null)
              ? "dummy"
              : data[i - 1].definition,
          context: context,
          counter: i
      );
      cards.add(card);
    }

  }

}
