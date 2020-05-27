import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:covidinfo/utilities/constants.dart';

class WebViewReuters extends StatefulWidget {
  @override
  _WebViewReutersState createState() => _WebViewReutersState();
}

class _WebViewReutersState extends State<WebViewReuters> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mapa do coronavírus',
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.redAccent[100],
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: darkPrimary,
      ),
      body: WebView(
          onWebViewCreated: (WebViewController controller) {
            _controller.complete(controller);
          },
          initialUrl: 'https://www.google.com/covid19-map/',
          javascriptMode: JavascriptMode.unrestricted),
    );
  }
}

