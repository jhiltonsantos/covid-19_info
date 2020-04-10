import 'package:flutter/material.dart';
import 'package:covidinfo/colors.dart';


Widget buildTextCharger(String text) {
  return Scaffold(
    backgroundColor: darkPrimary,
    body: Center(
      child: Text(text,
          style: TextStyle(color: darkPrimaryPurple, fontSize: 25.0),
          textAlign: TextAlign.center),
    ),
  );
}

Widget cardInfo(String text, IconData iconData, Color colorData) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
    color: darkPrimaryText,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          color: colorData,
          size: 60.0,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          text,
          style: TextStyle(
            color: colorData,
            fontFamily: 'Roboto',
            fontSize: 16.0,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
