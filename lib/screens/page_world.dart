import 'package:covidinfo/services/api_covid.dart';
import 'package:covidinfo/services/wv_reuters.dart';
import 'package:covidinfo/utilities/widget.dart';
import 'package:covidinfo/utilities/constants.dart';
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
            int confirmed = snapshot.data["confirmed"]["value"];
            int deaths = snapshot.data["deaths"]["value"];
            int sick = confirmed - deaths;
            int recovered = snapshot.data["recovered"]["value"];
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebViewReuters(),
                    ),
                  );
                },
                child: Icon(FontAwesomeIcons.plus),
                backgroundColor: Colors.redAccent,

              ),
              backgroundColor: darkPrimary,
              body: SafeArea(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30.0,
                    ),
                    CircleAvatar(
                      radius: 80.0,
                      backgroundImage: AssetImage('images/covid.png'),
                      backgroundColor: darkPrimary,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 2,
                        children: <Widget>[
                          GestureDetector(
                            child: cardInfo(
                                '$confirmed\nCasos', FontAwesomeIcons.virus, Colors.redAccent[100]),
                          ),
                          GestureDetector(
                            child: cardInfo(
                                '$sick\nDoentes', FontAwesomeIcons.headSideVirus, Colors.redAccent[100]),
                          ),
                          GestureDetector(
                            child: cardInfo(
                                '$recovered\nRecuperados', Icons.autorenew, Colors.redAccent[100]),
                          ),
                          GestureDetector(
                            child: cardInfo(
                                '$deaths\nMortes', FontAwesomeIcons.cross, Colors.redAccent[100]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      }
    },
  );
}
