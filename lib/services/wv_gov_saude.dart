import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:covidinfo/utilities/constants.dart';

class WebViewGovSaude extends StatefulWidget {
  @override
  _WebViewGovSaudeState createState() => _WebViewGovSaudeState();
}

class _WebViewGovSaudeState extends State<WebViewGovSaude> {
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

