import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:capstoneApp/screens/Images.dart';

class recent extends StatefulWidget {
  @override
  _recentState createState() => _recentState();
}

class _recentState extends State<recent> {
  final firedata = Firestore.instance;
  List<dynamic> d=[];
  void getdata()async{
   try{ await for (var i in firedata.collection('Fire').orderBy("createdAt").snapshots()){
    for( var t in i.documents){
      setState(() {
        d.add(t);
        print(d);

      });
    }
    print(d[1].data.values.toList().toString());
  }}
  catch(e){
   print(e);}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    print(d);
  }
  @override
  Widget build(BuildContext context) {

    if(d.length==0){
      return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: SpinKitRotatingCircle(
          color: Colors.blueAccent,
          size: 60.0,
        ),
      ),
    );}
    else{
      return Scaffold(
        appBar: AppBar(
          title: Text("Recent Fires"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          centerTitle: true,
        ),
        body:  ListView.builder(scrollDirection: Axis.vertical,
          itemCount: d.length,
          itemBuilder: (context, index) {
            return Card( //                           <-- Card widget
              child: ListTile(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>image(url: d[index].data.values.toList()[4].toString(),)));
                },
                title: Container(
                  //padding: EdgeInsets.fromLTRB(10,10,10,0),
                  height: 100,
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text(d[index].data.keys.toList()[0].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                decorationStyle: TextDecorationStyle.solid,
                              ),),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              d[index].data.values.toList()[0].toString(),
                              style: TextStyle(
                                  fontSize: 15.0
                              ),
                            ),


                          ],
                        ),
                      ),
                      SizedBox(
                        width: 0.0,
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text(d[index].data.keys.toList()[1].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                decorationStyle: TextDecorationStyle.solid,
                              ),),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              d[index].data.values.toList()[1].toString(),
                              style: TextStyle(
                                  fontSize: 15.0
                              ),
                            ),


                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text(d[index].data.keys.toList()[2].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                decorationStyle: TextDecorationStyle.solid,
                              ),),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              d[index].data.values.toList()[2].toString(),
                              style: TextStyle(
                                  fontSize: 15.0
                              ),
                            ),


                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text(d[index].data.keys.toList()[3].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                decorationStyle: TextDecorationStyle.solid,
                              ),),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              d[index].data.values.toList()[3].toString(),
                              style: TextStyle(
                                  fontSize: 15.0
                              ),
                            ),


                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            );
          },),
      );
    }

  }
}
