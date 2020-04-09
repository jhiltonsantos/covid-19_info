import 'package:covidinfo/api_covid.dart';
import 'package:covidinfo/widget.dart';
import 'package:covidinfo/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget buildPageWorld() {
  return FutureBuilder<Map>(
    future: getData(),
    // ignore: missing_return
    builder: (context, snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.none:
        case ConnectionState.waiting:
          return Center(child: buildTextCharger("Carregando Dados..."));
        default:
          if (snapshot.hasError) {
            return Center(child: buildTextCharger("Erro ao carregar dados"));
          } else {
            int confirmed = snapshot.data["confirmed"]["value"];
            int deaths = snapshot.data["deaths"]["value"];
            int sick = confirmed - deaths;
            int recovered = snapshot.data["recovered"]["value"];
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
                      backgroundImage: AssetImage('images/covid.png'),
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
                          FontAwesomeIcons.virus,
                          color: Colors.redAccent[100],
                        ),
                        title: Text(
                          '$confirmed Casos',
                          style: TextStyle(color: Colors.redAccent[100]),
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      color: darkPrimaryText,
                      child: ListTile(
                        leading: Icon(
                          FontAwesomeIcons.lungsVirus,
                          color: Colors.redAccent[100],
                        ),
                        title: Text(
                          '$sick Doentes',
                          style: TextStyle(color: Colors.redAccent[100]),
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      color: darkPrimaryText,
                      child: ListTile(
                        leading: Icon(
                          Icons.autorenew,
                          color: Colors.redAccent[100],
                        ),
                        title: Text(
                          '$recovered Recuperados',
                          style: TextStyle(
                            color: Colors.redAccent[100],
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
                          FontAwesomeIcons.cross,
                          color: Colors.redAccent[100],
                        ),
                        title: Text(
                          '$deaths Mortes',
                          style: TextStyle(color: Colors.redAccent[100]),
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
