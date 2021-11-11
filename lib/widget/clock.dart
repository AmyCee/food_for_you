import 'dart:async';

import 'package:flutter/material.dart';

class NewStopWatch extends StatefulWidget {

  @override
  _NewStopWatchState createState() => _NewStopWatchState();
}

class _NewStopWatchState extends State<NewStopWatch> {

  Stopwatch watch = Stopwatch();
  late Timer timer;
  bool startStop = true;

  String elapsedTime = '';

  updateTime(Timer timer) {
    if (watch.isRunning) {
      setState(() {
        print("startstop Inside=$startStop");
        elapsedTime = transformMilliSeconds(watch.elapsedMilliseconds);
      });
    }
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Text(elapsedTime, style: TextStyle(fontSize: 25.0)),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                  heroTag: "btn1",
                  backgroundColor: Colors.red,
                  onPressed: () => startOrStop(),
                  child: startStop ? Icon(Icons.stop) : Icon(Icons.pause)),
              SizedBox(width: 20.0),
              FloatingActionButton(
                  heroTag: "btn2",
                  backgroundColor: Colors.green,
                  onPressed: () => startWatch(), //resetWatch,
                  child: Icon(Icons.play_arrow_rounded)),
            ],
          )
        ],
      ),
    );
  }

  startOrStop() {
    if(startStop) {
      resetWatch();
    } else {
      stopWatch();
    }
  }

  startWatch() {
    setState(() {
      startStop = false;
      watch.start();
      timer = Timer.periodic(Duration(milliseconds: 100), updateTime);
    });
  }

  stopWatch() {
    setState(() {
      startStop = true;
      watch.stop();
      setTime();
    });
  }

  setTime() {
    var timeSoFar = watch.elapsedMilliseconds;
    setState(() {
      elapsedTime = transformMilliSeconds(timeSoFar);
    });
  }

  resetWatch() {
    setState(() {
      startStop = true;
      watch.reset();
      setTime();
    });
  }

  transformMilliSeconds(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return "$hoursStr:$minutesStr:$secondsStr";
  }
}