import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PostData extends StatefulWidget {
  @override
  _PostDataState createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Post Fire analyis'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
      body: WebView(
        initialUrl: 'https://forest-fire-post.herokuapp.com/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}