import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutterpocket/src/utils/constants.dart';
class WebViewExample extends StatelessWidget {
  final String title;
  WebViewExample(this.title);
  final selfkey = UniqueKey();
  final url = 'https://google.com';
  final flutterUrl = 'https://flutter.io';
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
              child: WebView(
                key: selfkey,
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: flutterUrl,
              ),
            )
          ],
        ),
      ),
    );
  }
}