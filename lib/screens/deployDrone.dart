import 'package:capstoneApp/screens/drone.dart';
import 'package:flutter/material.dart';

class DroneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deploy the Drone'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Card(
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/djitello.jpg",
                        height: 150,
                        width: 150,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          Text("DJI TELLO"),
                          Text("Range : 500 sq.meters")
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //RaisedButton(onPressed: null , child: Text("Check Drone Status" ),),
                      RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Drone("DJI TELLO")),
                            );
                          },
                          child: Text("Deploy Drone"))
                    ],
                  )
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/dji1.jpg",
                        height: 150,
                        width: 150,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          Text("DJI Phantom"),
                          Text("Range : 5 sq.Kilo meters")
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //RaisedButton(onPressed: null , child: Text("Check Drone Status" ),),
                      RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Drone("DJI Phantom")),
                            );
                          },
                          child: Text("Deploy Drone"))
                    ],
                  )
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/custom.jpeg",
                        height: 150,
                        width: 150,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          Text("Custom Drone"),
                          Text("Range : 300 sq.meters")
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //RaisedButton(onPressed: null , child: Text("Check Drone Status" ),),
                      RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Drone("Custom Drone")),
                            );
                          },
                          child: Text("Deploy Drone"))
                    ],
                  )
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/dji2.jpg",
                        height: 150,
                        width: 150,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          Text("DJI MAVIC 2 "),
                          Text("Range : 20000 sq.meters")
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //RaisedButton(onPressed: null , child: Text("Check Drone Status" ),),
                      RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Drone("DJI MAVIC 2 ")),
                            );
                          },
                          child: Text("Deploy Drone"))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
