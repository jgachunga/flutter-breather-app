import 'package:flutter/material.dart';
import 'package:flutter_demo_app/breath_list/models/timer_model.dart';
import 'package:flutter_demo_app/breath_list/models/elapsed_time.dart';

class MinutesAndSeconds extends StatefulWidget {
  const MinutesAndSeconds({required this.dependencies});
  final TimerModel dependencies;

  @override
  MinutesAndSecondsState createState() =>
      MinutesAndSecondsState(dependencies: dependencies);
}

class MinutesAndSecondsState extends State<MinutesAndSeconds> {
  MinutesAndSecondsState({required this.dependencies});
  final TimerModel dependencies;

  int minutes = 0;
  int seconds = 0;

  @override
  void initState() {
    dependencies.timerListeners.add(onTick);
    super.initState();
  }

  void onTick(ElapsedTime elapsed) {
    if (elapsed.minutes != minutes || elapsed.seconds != seconds) {
      setState(() {
        minutes = elapsed.minutes;
        seconds = elapsed.seconds;
      });
      dependencies.minutes = elapsed.minutes;
      dependencies.seconds = elapsed.seconds;
    }
  }

  @override
  Widget build(BuildContext context) {
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    return Text('$minutesStr:$secondsStr', style: dependencies.textStyle);
  }
}