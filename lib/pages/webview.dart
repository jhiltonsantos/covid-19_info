import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../colors.dart';

// ignore: must_be_immutable
class WebViewAbout extends StatelessWidget {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GithubProject',
          style: TextStyle(fontSize: 25.0, color: darkPrimaryPurple),
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
