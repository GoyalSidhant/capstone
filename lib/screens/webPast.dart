import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PastData extends StatefulWidget {
  @override
  _PastDataState createState() => _PastDataState();
}

class _PastDataState extends State<PastData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Past analyis'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
      body: WebView(
        initialUrl: 'https://forest-fire-india-dashboard.web.app/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}