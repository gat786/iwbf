import 'package:flutter/material.dart';

createDialog({context,message,height}){
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0)
          ),
          title: Text("Information"),
          content: Container(
            height: height,
            width: MediaQuery.of(context).size.width - 100,
            child: ListView(
              children: <Widget>[
                Text(message)
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text("Okay"),
            )
          ],

        );
      }
  );
}