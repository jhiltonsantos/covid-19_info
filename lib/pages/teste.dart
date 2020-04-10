import 'package:covidinfo/api_covid.dart';
import 'package:covidinfo/pages/webview_news.dart';
import 'package:covidinfo/widget.dart';
import 'package:covidinfo/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:transparent_image/transparent_image.dart';

Widget buildPageNews() {
  return FutureBuilder<Map>(
    future: getDataNews(),
    // ignore: missing_return
    builder: (context, snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.none:
        case ConnectionState.waiting:
          return Scaffold(
              backgroundColor: darkPrimary,
              body: Column(
                children: <Widget>[
                  Expanded(
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
                ],
              )
          );
        default:
          if (snapshot.hasError) {
            return Center(child: buildTextCharger("Erro ao carregar dados"));
          } else {
            return _createNewTable(context, snapshot);
          }
      }
    },
  );
}

Widget _createNewTable(BuildContext context, AsyncSnapshot snapshot) {
  return SafeArea(
    child: GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: snapshot.data["articles"].length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: snapshot.data["articles"][index]["urlToImage"],
            height: 200,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    WebViewNews(snapshot.data["articles"][index]),
              ),
            );
          },
        );
      },
    ),
  );
}
