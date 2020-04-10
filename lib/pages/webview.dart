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

class WebViewGovSaude extends StatelessWidget {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Painel Coronavírus',
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.yellow[400],
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: darkPrimary,
      ),
      body: WebView(
          onWebViewCreated: (WebViewController controller) {
            _controller.complete(controller);
          },
          initialUrl: 'https://covid.saude.gov.br/',
          javascriptMode: JavascriptMode.unrestricted),
    );
  }
}

class WebViewReuters extends StatelessWidget {
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
          style: TextStyle(fontSize: 14.0, color: Colors.lightGreenAccent, fontFamily: 'DMSerif'),
        ),
        backgroundColor: darkPrimary,
      ),
      body: WebView(
          onWebViewCreated: (WebViewController controller) {
            _controller.complete(controller);
          },
          initialUrl: _newsData["url"],
          javascriptMode: JavascriptMode.disabled),
    );
  }
}

