import 'package:flutter/material.dart';
import 'dart:math';

import 'package:iwbf/data/quotes.dart';

var random = new Random();

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Color.fromARGB(255,243, 156, 18),
        body: Stack(children: <Widget>[
          
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage("assets/images/jogging.png"),
                fit: BoxFit.cover
              )
            ),
          ),


          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 100.0,),

                Text('I Will Be Fit',
                style: TextStyle(
                  fontFamily: 'Lobster',
                  fontSize: 50.0,
                  color: Colors.white
                  ),
                ),

                SizedBox(height: 100.0,),

                Padding(
                  padding: const EdgeInsets.only(left: 16.0,right: 16.0),
                  child: Text(quotes[random.nextInt(quotes.length)],
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.95),
                      fontFamily: 'DancingScript',
                      fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                ),

                SizedBox(
                  height: 100.0,
                ),

                IconButton(
                  icon: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("/select");
                  },
                )

              ],
            ),
          ),



        ],)
          
            
      );
    }
  }
