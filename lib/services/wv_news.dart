import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:covidinfo/utilities/constants.dart';


class WebViewNews extends StatefulWidget {
  final Map _newsData;
  WebViewNews(this._newsData);

  @override
  _WebViewNewsState createState() => _WebViewNewsState();
}

class _WebViewNewsState extends State<WebViewNews> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget._newsData["title"],
          style: TextStyle(fontSize: 14.0, color: Colors.lightGreenAccent, fontFamily: 'DMSerif'),
        ),
        backgroundColor: darkPrimary,
      ),
      body: WebView(
          onWebViewCreated: (WebViewController controller) {
            _controller.complete(controller);
          },
          initialUrl: widget._newsData["url"],
          javascriptMode: JavascriptMode.disabled),
    );
  }
}

