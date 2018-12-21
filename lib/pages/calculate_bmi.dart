import 'package:flutter/material.dart';

import 'package:iwbf/data/colors.dart';
import 'package:iwbf/data/random_data.dart';
import 'package:iwbf/functions/conversions.dart';
import 'package:iwbf/functions/info_alert_box.dart';

class CalculateBmi extends StatefulWidget {
  @override
  _CalculateBmiState createState() => _CalculateBmiState();
}


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

class _CalculateBmiState extends State<CalculateBmi> {

  final weightController = TextEditingController();
  final heightController = TextEditingController();

  final bmiCategories = [
    "Under-Weight",
    "Normal-Weight",
    "Overweight",
    "Obesity"
  ];

  var cardVisibility = 0.0;
  var calculatedBmi = 0.0;
  var calculatedCategory = "";

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Form(
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
                      if(_formkey.currentState.validate()) {
                        calculatedBmi = calculateBmi(
                          height: double.parse(heightController.text),
                          weight: double.parse(weightController.text),
                          heightFormat: currentHeightItem,
                          weightFormat: currentWeightItem,
                        );

                        calculatedCategory = getCategory(calculatedBmi);

                        print("Calculated bmi is $calculatedBmi");
                        cardVisibility = 1.0;
                        this.setState(() {});
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))
                    ),
                  ),
                ),


                Opacity(
                  opacity: cardVisibility,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Stack(
                        children: <Widget>[

                          Container(
                            height: 220.0,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: <Widget>[

                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: Container(
                                    child: Text("Calculated BMI is",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    padding: EdgeInsets.all(16.0),
                                  ),
                                ),


                                Text(calculatedBmi.roundToDouble().toString(),
                                  style: TextStyle(
                                    fontSize: 50.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                                Text("Category: $calculatedCategory",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FlatButton(onPressed: (){

                                    createDialog(context: context,
                                        message: bmiMessage,
                                        height: MediaQuery.of(context).size.height / 2
                                      );
                                    },

                                    child: Text("Show-Info",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white
                                      ),
                                    ),

                                    color: Colors.blue,

                                  ),
                                ),


                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              child: IconButton(
                                icon: Icon(Icons.close),
                                onPressed: (){
                                  cardVisibility = 0.0;
                                  this.setState((){});
                                },
                              ),
                            ),
                          )


                        ],
                      ),
                    ),
                  ),
                ),

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


  calculateBmi({weight,height,weightFormat,heightFormat}){

    //converting to cm
    final baseHeight = getHeightInMetres(
        height: height,
        heightMeasures: heightMeasures,
        heightFormat: heightFormat
    );

    print("base height is $baseHeight");

    //converting to kg
    final baseWeight = getWeightInKg(
        weight: weight,
        weightFormat: weightFormat,
        weightMeasures: weightMeasures
    );

    print("base weight is $baseWeight");

    var bmi = baseWeight / (baseHeight * baseHeight);
    return bmi;
  }

  getCategory(bmi){
    if(bmi < 18.5)
      return bmiCategories[0];
    else if (18.5 <= bmi && bmi < 25)
      return bmiCategories[1];
    else if (25 <= bmi && bmi < 30)
      return bmiCategories[2];
    else if (bmi >= 30)
      return bmiCategories[3];
  }

}

