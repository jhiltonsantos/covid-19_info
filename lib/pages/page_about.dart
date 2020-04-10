import 'package:covidinfo/api_covid.dart';
import 'package:covidinfo/widget.dart';
import 'package:covidinfo/colors.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

Widget buildPageAbout() {
  return FutureBuilder<Map>(
    future: getData(),
    // ignore: missing_return
    builder: (context, snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.none:
        case ConnectionState.waiting:
        return Scaffold(
          backgroundColor: darkPrimary,
          body: Center(
            child: Container(
              alignment: Alignment.center,
              width: 70,
              height: 70,
              child: CircularProgressIndicator(
                backgroundColor: darkPrimary,
                valueColor: AlwaysStoppedAnimation<Color>(darkPrimaryPurple),
                strokeWidth: 5.0,
              ),
            ),
          ),
        );
        default:
          if (snapshot.hasError) {
            return Center(child: buildTextCharger("Erro ao carregar dados"));
          } else {
            String lastUpdate = snapshot.data["lastUpdate"];
            return Scaffold(
              backgroundColor: darkPrimary,
              body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 40.0,
                    ),
                    CircleAvatar(
                      radius: 80.0,
                      backgroundImage: AssetImage('images/github.png'),
                      backgroundColor: darkPrimary,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      color: darkPrimaryText,
                      child: ListTile(
                        leading: Icon(
                          Icons.calendar_today,
                          color: Colors.blue[300],
                        ),
                        title: Text(
                          'Atualizado em... $lastUpdate',
                          style: TextStyle(
                            color: Colors.blue[300],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      color: darkPrimaryText,
                      child: ListTile(
                        leading: Icon(
                          MdiIcons.api,
                          color: Colors.blue[300],
                        ),
                        title: Text(
                          'https://github.com/mathdroid/covid-19-api/tree/master/api',
                          style: TextStyle(
                            color: Colors.blue[300],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      color: darkPrimaryText,
                      child: ListTile(
                        leading: Icon(
                          MdiIcons.github,
                          color: Colors.blue[300],
                        ),
                        title: Text(
                          'jhiltonsantos/covid-19_info',
                          style: TextStyle(
                            color: Colors.blue[300],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
      }
    },
  );
}
