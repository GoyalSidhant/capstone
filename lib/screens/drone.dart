import 'package:flutter/material.dart';

class Drone extends StatelessWidget {
  final String name ;
  Drone(this.name);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: Text(name),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        body: Container(
          color: Colors.black,
          child: Center(
              
              child: AlertDialog(
                title: Text("Drone Connection not Established"),
                actions: [
                  RaisedButton(
                    onPressed: (){Navigator.pop(context);},
                    child: Text("Retry" , style: TextStyle(color: Colors.red),),
                  )
                ],
            ),
          ),

        ),
      
    );
  }
}