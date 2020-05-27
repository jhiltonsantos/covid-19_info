import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../utilities/constants.dart';

class WebViewAbout extends StatefulWidget {
  @override
  _WebViewAboutState createState() => _WebViewAboutState();
}

class _WebViewAboutState extends State<WebViewAbout> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GithubProject',
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.blue[300],
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: darkPrimary,
      ),
      body: WebView(
          onWebViewCreated: (WebViewController controller) {
            _controller.complete(controller);
          },
          initialUrl: 'https://github.com/jhiltonsantos/covid-19_info',
          javascriptMode: JavascriptMode.unrestricted),
    );
  }
}

