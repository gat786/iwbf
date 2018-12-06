import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:iwbf/pages/weekly_plan.dart';

class FitnessScheme extends StatefulWidget {
  @override
  _FitnessSchemeState createState() => _FitnessSchemeState();


}

var message = "some random facts about the activity that is to be done in the program";
Color cardTitleTextColor = Color.fromARGB(255, 231, 76, 60);

class _FitnessSchemeState extends State<FitnessScheme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Select Course"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255,243, 156, 18),
          automaticallyImplyLeading: false,
        ),
        body: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Material(
          child: ListView(

            children: <Widget>[

              cardWidget(
                context,
                (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => WeeklySchedule("Fat Loss", "https://res.cloudinary.com/dtldj8hpa/image/upload/v1544121166/Abs.jpg")
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
                      builder: (BuildContext context) => WeeklySchedule("Belly Fat Loss", "https://res.cloudinary.com/dtldj8hpa/image/upload/v1544121166/Abs.jpg")
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
                      builder: (BuildContext context) => WeeklySchedule("Six Pack Abs", "https://res.cloudinary.com/dtldj8hpa/image/upload/v1544121166/Abs.jpg")
                    )  
                  );
                },
                imagePath: "assets/icons/fitness.svg",
                message: message,
                cardTitle: "Six Pack Abs"
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
    height: 180.0,
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 10.0),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: InkWell(
          child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(25.0),
              width: 150.0,
              child: SvgPicture.asset(imagePath,width: 100,color: Color.fromARGB( 255, 241, 196, 15 ),),
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
                      color: cardTitleTextColor
                      ),
                    textAlign: TextAlign.center,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                       style: TextStyle(
                         fontFamily: 'Lato',
                         color: Colors.black54
                       ),
                    ),
                  )

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