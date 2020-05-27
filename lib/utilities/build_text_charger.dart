import 'package:flutter/material.dart';
import 'package:covidinfo/utilities/constants.dart';

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