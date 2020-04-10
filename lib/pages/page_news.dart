import 'package:covidinfo/api_covid.dart';
import 'package:covidinfo/pages/webview.dart';
import 'package:covidinfo/widget.dart';
import 'package:covidinfo/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:transparent_image/transparent_image.dart';

Widget buildPageNews() {
  return Scaffold(
    backgroundColor: darkPrimary,
    body: Center(
      child: FutureBuilder<Map>(
        future: getDataNews(),
        // ignore: missing_return
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Container(
                alignment: Alignment.center,
                width: 70,
                height: 70,
                child: CircularProgressIndicator(
                  backgroundColor: darkPrimary,
                  valueColor: AlwaysStoppedAnimation<Color>(darkPrimaryPurple),
                  strokeWidth: 5.0,
                ),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                    child: buildTextCharger("Erro ao carregar dados"));
              } else {
                return _createNewTable(context, snapshot);
              }
          }
        },
      ),
    ),
  );
}

Widget _createNewTable(BuildContext context, AsyncSnapshot snapshot) {
  return SafeArea(
    child: GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: snapshot.data["articles"].length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              color: darkPrimaryText,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: 400.0,
                    height: 100.0,
                    child: Card(
                      color: darkPrimaryText,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: Center(
                          child: Text(
                            _titleWebCard(snapshot, index),
                            style: TextStyle(
                              color: Colors.lightGreenAccent,
                              fontSize: 18.0,
                              fontFamily: 'DMSerif'
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: _imageWebCard(snapshot, index),
                        width: 350.0,
                        height: 160.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ),
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

String _imageWebCard(AsyncSnapshot snapshot, int index) {
  if (snapshot.data["articles"][index]["urlToImage"] == null)
    return 'https://cdn4.iconfinder.com/data/icons/academic-disciplines-color/64/current-events-512.png';

  return snapshot.data["articles"][index]["urlToImage"];
}

String _titleWebCard(AsyncSnapshot snapshot, int index) {
  String title = snapshot.data["articles"][index]["title"];
  return title;
}
