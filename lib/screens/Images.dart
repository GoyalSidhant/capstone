import 'package:capstoneApp/screens/google_maps.dart';
import 'package:flutter/material.dart';
class image extends StatefulWidget {
  String url;
  image({this.url});
  @override
  _imageState createState() => _imageState();
}
class _imageState extends State<image> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recent Fire Image"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 240,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(widget.url),
                      fit: BoxFit.fill)
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              elevation: 10,
              child: FlatButton(onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>maps()));
              }, child: Text('See on Map')),
            )
          ],
        ),

      ),
    );
  }
}
