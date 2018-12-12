import 'package:flutter/material.dart';
import 'package:iwbf/data/colors.dart';
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

  final imgurl1="https://res.cloudinary.com/dtldj8hpa/image/upload/c_scale,w_889/v1544416676/iwillbefit/emma-simpson-153970-unsplash.jpg";

  final imgurl2="https://res.cloudinary.com/dtldj8hpa/image/upload/c_scale,w_936/v1544416190/iwillbefit/jogging.jpg";

  final imgurl3="https://res.cloudinary.com/dtldj8hpa/image/upload/c_scale,w_1463/v1544416296/iwillbefit/meghan-holmes-1057329-unsplash.jpg";

  @override
  Widget build(BuildContext context) {
    List<Widget> cards =[];
    for (int i = 1;i<4;i++) {
      Widget card = exerciseCard(
        assetPath: imgurl2,
        exerciseName: "Push Ups",
        exerciseDetails: "This is the exercise used by beginner as well as experts as it increases core strength and fitness",
        context: context,
        counter: i
      );
      cards.add(card);
    }
    return Scaffold(

      appBar: AppBar(
        backgroundColor: primary,
        centerTitle: true,
        title: Text("${widget.courseName}: Day ${widget.dayNumber}"),
      ),




      body: Material(
        child: ListView(
          children: <Widget>[

            exerciseCard(
              assetPath: "",
              exerciseName: "Push Ups",
              exerciseDetails: "This is the exercise used by beginner as well as experts as it increases core strength and fitness",
              context: context,
            ),

            cards[0],
            cards[1],
            cards[2]

          ],
        ),
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
          height: 60.0,
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
}