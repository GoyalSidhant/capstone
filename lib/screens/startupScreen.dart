import 'dart:convert';
import 'dart:developer';
import 'package:capstoneApp/global.dart' as global;
import 'package:capstoneApp/models/weather.dart';
import 'package:capstoneApp/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class StartupScreen extends StatefulWidget {
  @override
  _StartupScreenState createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  double screenHeight;
  locationHandler() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    String url = 'http://api.openweathermap.org/data/2.5/weather?lat=' +
        position.latitude.toString() +
        '&lon=' +
        position.longitude.toString() +
        '&APPID=6adf87802066a3ee22591eb3f8abfe0c';
    final response = await http.get(url);
    log(response.body);
    global.weather =  Weather.fromJson(json.decode(response.body));
    Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    super.initState();
    locationHandler();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: /* Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.green, Colors.white],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'),
            Text("Forest Protectors",
                style: TextStyle(
                    color: Colors.orange[700],
                    fontWeight: FontWeight.w700,
                    fontSize: 30))
          ],
        ),
      ),
    )); */
    Stack(
        children: <Widget>[
          backgroundImage(context),
          backgroundImageTint(context),
          pageTitle(),
        ],

    )

    );
  }
  Widget pageTitle() {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 200.0,
              width: 200.0,
              child: Image.asset(
                'assets/logo.png',
//              fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
                Text(
                  "Forest",
                  style: TextStyle(
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(6.0, 6.0),
                        blurRadius: 15.0,
                        color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
                      ),
                    ],
                    fontSize: 34,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    //fontFamily: 'Circular Std',
                  ),
                ),
                Text(
                  "Protectors",
                  style: TextStyle(
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(6.0, 6.0),
                        blurRadius: 15.0,
                        color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
                      ),
                    ],
                    fontSize: 34,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    //fontFamily: 'Circular Std',
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget backgroundImage(BuildContext context) {
    return Container(
      height: screenHeight,
      child: Image.asset(
        'assets/forest.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget backgroundImageTint(BuildContext context) {
    return Container(
      height: screenHeight,
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.8),
      ),
    );
  }
}
