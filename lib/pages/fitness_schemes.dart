import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iwbf/data/drawer_icons.dart';
import 'package:iwbf/data/colors.dart';



import 'package:iwbf/pages/scheduler.dart';



class FitnessScheme extends StatefulWidget {
  @override
  _FitnessSchemeState createState() => _FitnessSchemeState();


}

var message = "some random facts about the activity that is to be done in the program";


class _FitnessSchemeState extends State<FitnessScheme> {

  Offset startPosition;
  Offset endPosition;

  _buildDrawer(context){
    return Drawer(
      child: Container(
        child: ListView(
          children: <Widget>[

            DrawerHeader(
              child: Container(

              ),
            ),

            ListTile(
              leading: select,
              title: Text("Select Course"),
              onTap: (){
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: reminder,
              title: Text("Set a Reminder"),
              onTap: (){
                Navigator.popAndPushNamed(context, '/reminder');
              },
            ),

            ListTile(
              leading: bmi,
              title: Text("Calculate BMI"),
              onTap: (){
                Navigator.popAndPushNamed(context, '/bmi');
              },
            ),

            ListTile(
              leading: bmr,
              title: Text("Calculate BMR"),
              onTap: (){
                Navigator.popAndPushNamed(context, '/bmr');
              },
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: (){

              },
            ),

          ],
        ),
      ),
    );
  }


  GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder:(BuildContext context) {
        return Scaffold(
          key: key,
          drawer: _buildDrawer(context),
          body: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Material(
                child: ListView(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Container(
                          height: 310.0,
                          width: MediaQuery.of(context).size.width,

                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 200,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16.0,left: 16.0),
                                      child: Row(
                                        children: <Widget>[
                                          IconButton(
                                            icon: Icon(
                                              Icons.menu,
                                              size: 32.0,
                                            ),
                                            onPressed: (){
                                              key.currentState.openDrawer();
                                            },
                                          )
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.all(24.0),
                                      child: Column(
                                        children: <Widget>[
                                          Text("I Will",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 52.0,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),

                                          Text("Be Fit",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 52.0
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                width: MediaQuery.of(context).size.width - 200,
                                child: Center(
                                  child: SvgPicture.asset("assets/icons/fit-guy.svg",
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),

                          cardBuilder(context,
                            "Belly Fat Loss",
                            "assets/icons/liposuction.svg"
                          ),
                         cardBuilder(context,
                            "Six Pack Abs",
                            "assets/icons/fitness.svg"
                          ),



                          cardBuilder(context,
                            "Fat Loss",
                            "assets/icons/waist.svg"
                          ),

                      ],
                    ),
                  ],
                )
              ),
            ),
          );
        }
      );
    }
  }

moveTo(context,courseType){
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => Scheduler(courseType: courseType,)
      )
  );
}


cardBuilder(context,title,icon){
  return Container(
    margin: EdgeInsets.only(top: 8.0),
    height: 250.0,
    width: MediaQuery.of(context).size.width,
    child: Stack(
      children: <Widget>[

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
                child: InkWell(

                  onTap: (){
                    moveTo(context, title);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),

                    child: Material(
                      color: primary,
                      child: Column(
                        children: <Widget>[

                          Container(
                              height: 70.0,
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  title,
                                  style: TextStyle(
                                      fontSize: 24.0
                                  ),
                                ),
                              )
                          ),


                          Container(
                            height: 150.0,
                            child: Center(
                              child:SvgPicture.asset(icon,
                                height: 100.0,
                                color: Colors.white,
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)
              ),
            ),
          ),

      ],
    ),
  );
}