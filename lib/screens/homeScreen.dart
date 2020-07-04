import 'dart:developer';

import 'package:capstoneApp/screens/aboutusScreen.dart';
import 'package:capstoneApp/screens/deployDrone.dart';
import 'package:capstoneApp/screens/webPast.dart';
import 'package:capstoneApp/screens/webPost.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:capstoneApp/global.dart' as global;
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  areaimpact()async{
    String url = "https://area-burn-pred.herokuapp.com/predict?c='${global.position.longitude.toString()},${global.position.latitude.toString()}'";
    print(url);
    http.Response response = await http.post(url);
    log(response.body.toString());
    setState(() {
      areaImapct = response.body.toString();
    });

  }
  String areaImapct = "None";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Welcome User"),
                accountEmail: Text(""),
                currentAccountPicture: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.white
                          : Colors.white,
                  child: Icon(Icons.person),
                ),
              ),
              ListTile(
                title: Text('Dashboard'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Deploy Drone'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DroneScreen()),
                  );
                },
              ),
              ListTile(
                title: Text('Our Work'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('About Us'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Aboutus()),
                  );
                },
              ),
              Card(
                color: Colors.red,
                child: Column(
                  children: [
                    Text("Report A Fire" , style:TextStyle( fontSize: 20 , fontWeight: FontWeight.w500 , color: Colors.white))
                  ],
                ),


              ),
            ],
          ),
        ),
        body: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          children: <Widget>[
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Weather',style: TextStyle(color: Colors.blueAccent)),
                          Text("${global.weather.main.feelsLike.toString()}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20.0)),
                          Text("Humidity:${global.weather.main.humidity.toString()}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20.0))
                        ],
                      ),
                      Material(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(24.0),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(Icons.wb_sunny,
                                color: Colors.white, size: 30.0),
                          )))
                    ]),
              ),
            ),
            _buildTile(
             
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Material(
                          color: Colors.teal,
                          shape: CircleBorder(),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(Icons.add_alert,
                                color: Colors.white, size: 30.0),
                          )),
                      Padding(padding: EdgeInsets.only(bottom: 16.0)),
                      Text('Past Analysis ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 24.0)),
                      //Text('Images, Videos', style: TextStyle(color: Colors.black45)),
                    ]),
              ),
              onTap: (){ 
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PastData()),
                  );

              }
            ),
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Material(
                          color: Colors.amber,
                          shape: CircleBorder(),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Icon(Icons.notifications,
                                color: Colors.white, size: 30.0),
                          )),
                      Padding(padding: EdgeInsets.only(bottom: 16.0)),
                      Text('Recent Fires',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 24.0)),
                      //Text('All ', style: TextStyle(color: Colors.black45)),
                    ]),
              ),
            ),
            _buildTile(
              Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Impact of Fire',
                                  style: TextStyle(color: Colors.green)),
                              Text(areaImapct, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20.0)),
                            ],
                          ),
                          RaisedButton(onPressed: areaimpact  , child: Text("Get Updates"))
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 4.0)),
                    ],
                  )),
            ),
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Post Fire Analysis',
                              style: TextStyle(color: Colors.redAccent)),
                          Text('173',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 34.0))
                        ],
                      ),
                      Material(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(24.0),
                          child: Center(
                              child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Icon(Icons.store,
                                color: Colors.white, size: 30.0),
                          )))
                    ]),
              ),
              onTap: (){ 
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PostData()),
                  );

              }
              // onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ShopItemsPage())),
            )
          ],
          staggeredTiles: [
            StaggeredTile.extent(2, 110.0),
            StaggeredTile.extent(1, 180.0),
            StaggeredTile.extent(1, 180.0),
            StaggeredTile.extent(2, 220.0),
            StaggeredTile.extent(2, 110.0),
          ],
        ));
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: InkWell(
            // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null
                ? () => onTap()
                : () {
                    print('Not set yet');
                  },
            child: child));
  }
}
