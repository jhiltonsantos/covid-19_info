import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../colors.dart';

// ignore: must_be_immutable
class WebViewNews extends StatelessWidget {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  final Map _newsData;
  WebViewNews(this._newsData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _newsData["title"],
          style: TextStyle(fontSize: 14.0, color: Colors.lightGreenAccent),
        ),
        backgroundColor: darkPrimary,
      ),
      body: WebView(
          onWebViewCreated: (WebViewController controller) {
            _controller.complete(controller);
          },
          initialUrl: _newsData["url"],
          javascriptMode: JavascriptMode.unrestricted),
    );
  }
}
