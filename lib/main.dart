import 'package:covidinfo/screens/screen_about.dart';
import 'package:covidinfo/screens/screen_brazil.dart';
import 'package:covidinfo/screens/screen_news.dart';
import 'package:covidinfo/screens/screen_world.dart';
import 'package:flutter/material.dart';
import 'package:covidinfo/screens/home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid-19 Info',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        'sc_about': (context) => buildPageAbout(),
        'sc_world': (context) => buildPageWorld(),
        'sc_news': (context) => buildPageNews(),
        'sc_brazil': (context) => buildPageBrazil()
      },
    ),
  );
}
