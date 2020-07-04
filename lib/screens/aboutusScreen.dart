import 'package:flutter/material.dart';

class Aboutus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  child: Column(
                    children: [
                      ClipRRect(
                        //borderRadius: BorderRadius.circular(),
                        child: Image.asset(
                          'assets/sidhant.jpeg',
                          height: height / 5,
                          width: width / 5,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("Sidhant Goyal",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18)),
                      Text("Deep Learning Researcher"),
                      Text("Flutter Developer"),
                      Text("Backend Developer")
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      ClipRRect(
                        //borderRadius: BorderRadius.circular(),
                        child: Image.asset(
                          'assets/md.png',
                          height: height / 5,
                          width: width / 5,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("MD Shagil",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18)),
                      Text("Deep Learning Researcher"),
                      Text("Flutter Developer"),
                      Text("Firebase Developer")
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  child: Column(
                    children: [
                      ClipRRect(
                        //borderRadius: BorderRadius.circular(),
                        child: Image.asset(
                          'assets/kakkar.png',
                          height: height / 5,
                          width: width / 5,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("Pranav Kakkar",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18)),
                      Text("Computer Vision Expert"),
                      Text("Content Curator"),
                      //Text("Backend Developer")
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      ClipRRect(
                        //borderRadius: BorderRadius.circular(),
                        child: Image.asset(
                          'assets/manan.png',
                          height: height / 5,
                          width: width / 5,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("Manan Vyas",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18)),
                      Text("Hardware Expert"),
                      Text("Graphic Designer"),
                      //Text("Backend Developer")
                    ],
                  ),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
