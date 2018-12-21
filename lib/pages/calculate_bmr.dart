import 'package:flutter/material.dart';
import 'package:iwbf/data/colors.dart';
import 'package:iwbf/data/random_data.dart';
import 'package:iwbf/functions/conversions.dart';
import 'package:iwbf/functions/info_alert_box.dart';

class CalculateBmr extends StatefulWidget {
  @override
  CalculateBmrState createState() {
    return new CalculateBmrState();
  }
}

var resultOpacity = 0.0;

final weightMeasures=["kgs.","lbs."];

createWeightDropList(){
  List<DropdownMenuItem<String>> items = [];
  for (var i in weightMeasures){
    final item = DropdownMenuItem<String>(child: Text(i),value: i,);
    items.add(item);
  }
  return items;
}

final heightMeasures=["cms.","ft.","mtr."];

createHeightDropList(){
  List<DropdownMenuItem<String>> items = [];
  for (var i in heightMeasures){
    final item = DropdownMenuItem<String>(child: Text(i),value: i,);
    items.add(item);
  }
  return items;
}
var weightItems = createWeightDropList();

var currentWeightItem = weightMeasures[1];


var heightItems = createHeightDropList();

var currentHeightItem = heightMeasures[1];

enum Gender{Male,Female}


class CalculateBmrState extends State<CalculateBmr> {

  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final ageController = TextEditingController();

  Gender selected = Gender.Male;

  var calculatedBmr = 0.0;

  final _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Container(
            height: MediaQuery.of(context).size.height,

            child:Form(
              key: _formkey,
              child: ListView(

                children: <Widget>[

                  Container(

                    height: 100.0,
                    child: Row(
                      children: <Widget>[

                        Container(
                          width: MediaQuery.of(context).size.width - 100,
                          height: 100.0,
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

                              validator: (value){
                                if(value.isEmpty)
                                  return "Cannot be empty.";
                              },

                              controller: weightController,
                            ),
                          ),
                          padding: EdgeInsets.all(8.0),

                        ),

                        Container(
                          height: 100.0,
                          width: 100,
                          child: Center(
                            child: DropdownButton(
                              items: weightItems,

                              onChanged: (value){
                                currentWeightItem  = value;
                                setState(() {

                                });
                              },

                              value: currentWeightItem,
                            ),
                          ),
                        )


                      ],
                    ),
                  ),

                  Container(

                    height: 100.0,
                    child: Row(
                      children: <Widget>[

                        Container(
                          width: MediaQuery.of(context).size.width - 100,
                          height: 100.0,
                          child: Center(
                            child: TextFormField(

                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                                  ),
                                  hintText: "Enter Height",
                                  prefixIcon: Icon(Icons.web)
                              ),

                              keyboardType: TextInputType.numberWithOptions(),

                              validator: (value){
                                if(value.isEmpty)
                                  return "Cannot be empty";
                              },

                              controller: heightController,
                            ),
                          ),
                          padding: EdgeInsets.all(8.0),

                        ),

                        Container(
                          height: 100.0,
                          width: 100,
                          child: Center(
                            child: DropdownButton(
                              items: heightItems,

                              onChanged: (value){
                                currentHeightItem  = value;
                                setState(() {

                                });
                              },

                              value: currentHeightItem,
                            ),
                          ),
                        )


                      ],
                    ),
                  ),


                  Container(
                    height: 80.0,
                    child: Center(
                      child: TextFormField(

                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8.0))
                            ),
                            hintText: "Enter Age",
                            prefixIcon: Icon(Icons.web)
                        ),

                        keyboardType: TextInputType.numberWithOptions(),

                        validator: (value){
                          if(value.isEmpty)
                            return "Cannot be empty";
                        },

                        controller: ageController,
                      ),
                    ),
                    padding: EdgeInsets.all(8.0),

                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60.0,
                    child: Row(
                      children: <Widget>[

                        Container(
                          width: MediaQuery.of(context).size.width/2,
                          child: RadioListTile(value: Gender.Male,
                            groupValue: selected,
                            onChanged: (value){
                              setState(() {
                                selected = value;
                              });
                            },
                            title: Text("Male"),
                          ),
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width/2,
                          child: RadioListTile(value: Gender.Female,
                            groupValue: selected,
                            onChanged: (value){
                              setState(() {
                                selected = value;
                              });
                            },
                            title: Text("Female"),
                          ),
                        ),

                      ],
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
                        if(_formkey.currentState.validate()){
                          calculatedBmr = calculateBmr(
                              age: double.parse(ageController.text),
                              height: double.parse( heightController.value.text),
                              weight: double.parse(weightController.text),
                              heightFormat: currentHeightItem,
                              weightFormat: currentWeightItem,
                              gender: selected
                          );

                          setState(() {
                            calculatedBmr = calculatedBmr;
                            resultOpacity = 1.0;
                          });
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))
                      ),
                    ),
                  ),


                  Opacity(
                    opacity: resultOpacity,
                    child: Container(
                      child: calculateResult(),
                    ),
                  )

                ],

              ),
            )
        ),
      ),


      appBar: AppBar(
        backgroundColor: primary,
        title: Text("Calculate Bmr"),
        centerTitle: true,
      ),
    );
  }


  calculateResult() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0)
      ),

      elevation: 4.0,

      child: Stack(
        children: <Widget>[


          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),

              child: Column(
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Your Calculated BMR is",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),


                  Container(
                    height: 100.0,
                    child: Center(
                      child: Text(
                        calculatedBmr.roundToDouble().toString(),
                        style: TextStyle(fontSize: 50.0,),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  FlatButton(onPressed:
                      () {
                        createDialog(context: context,
                          message: bmrMessage,
                          height: MediaQuery.of(context).size.height - 100,
                        );
                      },
                    child: Text("Show-Info",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.blue,

                  )

                ],
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: (){
                resultOpacity = 0.0;
                setState(() {

                });
              }
            )
          ),


        ],
      ),
    );
  }

  calculateBmr({weight,height,age,gender,weightFormat,heightFormat}){

    print("recieved height is $height and weight is $weight");
    print("recieved heightformat is $heightFormat and weightformat is $weightFormat");

    final baseWeight = getWeightInKg(
      weight: weight,
      weightFormat: weightFormat,
      weightMeasures: weightMeasures
    );

    final baseHeight = getHeightInCm(
      height: height,
      heightFormat: heightFormat,
      heightMeasures: heightMeasures
    );

    print("recieved baseheight is $baseHeight and baseweight is $baseWeight");

    var bmr;

    if(gender == Gender.Male)
      //formula for bmr for males
      bmr = (baseHeight * 6.25) + (baseWeight * 9.99) - (age * 4.92) + 5;
    else
      //formula for bmr for females
      bmr = (baseHeight * 6.25) + (baseWeight * 9.99) - (age * 4.92) - 161;

    return bmr;
  }

}
