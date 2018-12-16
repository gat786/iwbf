import 'package:flutter/material.dart';
import 'package:iwbf/data/colors.dart';
import 'package:iwbf/data/drawer_icons.dart';
import 'package:iwbf/data/random_data.dart';

class CalculateBmi extends StatefulWidget {
  @override
  CalculateBmiState createState() {
    return new CalculateBmiState();
  }
}

class CalculateBmiState extends State<CalculateBmi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Material(
        child: Container(
          height: MediaQuery.of(context).size.height,

             child:ListView(

                  children: <Widget>[

                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0))
                            ),
                            hintText: "Enter Weight",
                            prefixIcon: Icon(Icons.web)
                          ),
                          keyboardType: TextInputType.numberWithOptions(),
                        ),
                      ),
                    ),

                   Container(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0))
                            ),
                            hintText: "Enter Height",
                            prefixIcon: Icon(Icons.web),
                          ),
                          keyboardType: TextInputType.numberWithOptions(),
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(8.0),

                      child: FlatButton(
                        color: Colors.blue,
                        child: Container(
                          width: 100,
                          height: 50,
                          child: Center(
                            child: Text(
                              "Calculate",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0
                              ),
                            ),
                          ),
                        ),
                        onPressed: (){
                          print("calculate");
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))
                        ),
                      ),
                    ),


                    Container(
                      child: calculateResult(),
                    )

                  ],

                )
        ),
      ),


      appBar: AppBar(
        backgroundColor: primary,
        title: Text("Calculate Bmi"),
        centerTitle: true,
      ),
    );
  }

  calculateResult() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),

        child: Column(
          children: <Widget>[

            Text(
                "Your Calculated BMR is",
              style: TextStyle(fontSize: 16.0),
            ),


            Text(
                "hello",
              style: TextStyle(fontSize: 50.0),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(onPressed: (){createDialog(context);}, child: Text("showinfo"))
            )
          ],
        ),
      ),
    );
  }
  
  
  createDialog(context){
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context){
        return AlertDialog(
          title: Text("Information"),
          content: ListView(
            children: <Widget>[
              Text(
                  bmi_message
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
                onPressed:
                    (){
                  Navigator.of(context).pop();
                  },
                child: Text("Close")
            )
          ],
        );
      }
    );
  }
}
