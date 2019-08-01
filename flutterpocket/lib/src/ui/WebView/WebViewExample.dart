import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutterpocket/src/utils/constants.dart';
class WebViewExample extends StatefulWidget{
  final String title;
  WebViewExample(this.title);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WebViewSample();
  }
}
class WebViewSample extends State<WebViewExample> {
  
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  final selfkey = UniqueKey();
  final url = 'https://google.com';
  final flutterUrl = 'https://flutter.io';
  bool isInitialLoaded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(Constants.BgColor),
      appBar: AppBar(
        title: Text('Web View'),
        backgroundColor: Color(Constants.ThemeColor),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Opacity(
                  opacity: isInitialLoaded ? 1 : 0,
                  child: WebView(
                    initialUrl: flutterUrl,
                    javascriptMode: JavascriptMode.unrestricted,
                    onPageFinished: (String url) {
                      if (!isInitialLoaded) {
                        setState(() => isInitialLoaded = true);
                      }
                    },
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}