import 'package:flutter/material.dart';
import 'package:milestone_progress/milestone_progress.dart';

class milestone extends StatefulWidget {

  @override
  _milestoneState createState() => _milestoneState();
}

class _milestoneState extends State<milestone> {
  List<String>mile=['Amazon Forest Fire','Idea Generation','First model using Yolo V2 and UAV','Published Research Paper','Meeting with ForestFire Officials','Upgraded model to Yolo V3','Created mobile and web app'];
  int _counter = 0, totalMilestones = 6;
  double maxIconSize = 30, width = 250;

  void _incrementCounter() {
    print(MediaQuery.of(context).size.width);
    if (_counter < totalMilestones)
      setState(() {
        _counter++;
      });
  }

  void _decrementCounter() {
    print(MediaQuery.of(context).size.width);
    if (_counter > 0)
      setState(() {
        _counter--;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MileStones Achived'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MilestoneProgress(
                completedMilestone: _counter,
                maxIconSize: maxIconSize,
                totalMilestones: totalMilestones,
                width: width,
                completedIconData: Icons.favorite,
                completedIconColor: Colors.red,
                nonCompletedIconData: Icons.favorite,
                incompleteIconColor: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    '${mile[_counter]} milestone completed',

                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            SizedBox(
              height: 10,
            ),
//            FloatingActionButton(
//              onPressed: _decrementCounter,
//              tooltip: 'decrement',
//              child: Icon(Icons.remove),
//            ),
          ],
        ));
  }
}
