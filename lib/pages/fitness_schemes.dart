import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iwbf/data/colors.dart';
import 'package:iwbf/pages/scheduler.dart';



class FitnessScheme extends StatefulWidget {
  @override
  _FitnessSchemeState createState() => _FitnessSchemeState();


}

var message = "some random facts about the activity that is to be done in the program";


class _FitnessSchemeState extends State<FitnessScheme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Select Course"),
        //   centerTitle: true,
        //   backgroundColor: Color.fromARGB(255,243, 156, 18),
        //   automaticallyImplyLeading: false,
        // ),
        body: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Material(
          color: Colors.yellowAccent.withOpacity(0.6),
          child: Stack(
            children: [

              Container(

                height: MediaQuery.of(context).size.height / 2 - 100,
                width: MediaQuery.of(context).size.width,
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0),
                  ),
                  color: Colors.deepOrange,
                ),
                
                child: Padding(
                  padding: EdgeInsets.only(top:50.0,left: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[

                      Text(
                        "I WILL BE FIT",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          "Choose Your Preferred Course",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

              ),


              Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[


                  cardWidget(
                    context,
                    (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Scheduler(courseType: "Fat Loss")
                        )
                      );
                    },
                    imagePath: "assets/icons/waist.svg",
                    message: message,
                    cardTitle: "Fat Loss"
                  ),

                  cardWidget(
                    context,
                    (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Scheduler(courseType: "Belly Fat Loss")
                        )
                      );
                    },
                    imagePath: "assets/icons/liposuction.svg",
                    message: message,
                    cardTitle: "Belly Fat Loss"
                  ),

                  cardWidget(
                    context,
                    (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Scheduler(courseType: "Six Pack Abs",)
                        )
                      );
                    },
                    imagePath: "assets/icons/fitness.svg",
                    message: message,
                    cardTitle: "Six Pack Abs"
                  ),

                ],
              ),
            
            ],
          ),
        ),
      ),
    );
  }

}

Widget cardWidget(context,callback,{imagePath:null,cardTitle:null,message:null}){
  return  Container(
    height: 120.0,
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 10.0),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0)
      ),
      child: InkWell(
          child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              width: 150.0,
              child: SvgPicture.asset(
                imagePath,
                width: 100,
                color: Colors.redAccent,
              ),
            ),

            Container(
              height: double.infinity,
              width: MediaQuery.of(context).size.width - 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    cardTitle,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontFamily: 'Lato',
                      ),
                    textAlign: TextAlign.center,
                  ),

//                  Padding(
//                    padding: const EdgeInsets.only(top: 20.0),
//                    child: Text(
//                      message,
//                      textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontFamily: 'Lato',
//                         color: Colors.black54
//                       ),
//                    ),
//                  )

                ],
              ),
            ),
          ],
        ),
        onTap: callback,
      ),
    ),
  );
}
