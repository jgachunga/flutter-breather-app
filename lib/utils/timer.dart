import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo_app/breath_list/models/timer_model.dart';
import 'package:flutter_demo_app/breath_list/models/elapsed_time.dart';
import 'package:flutter_demo_app/widgets/minutes_and_seconds.dart';


class TimerText extends StatefulWidget {
  const TimerText({required this.dependencies});
  final TimerModel dependencies;

  @override
  TimerTextState createState() =>
      TimerTextState(dependencies: this.dependencies);
}

class TimerTextState extends State<TimerText> {
  int milliseconds = 1000;
  Timer? timer;

  TimerTextState({required this.dependencies});
  final TimerModel dependencies;

  @override
  void initState() {
    timer = Timer.periodic(
        Duration(milliseconds: dependencies.timerMillisecondsRefreshRate),
        callback);
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  void callback(Timer timer) {
    if (milliseconds != dependencies.stopwatch.elapsedMilliseconds) {
      milliseconds = dependencies.stopwatch.elapsedMilliseconds;
      final int hundreds = (milliseconds / 10).truncate();
      final int seconds = (hundreds / 100).truncate();
      final int minutes = (seconds / 60).truncate();

      final ElapsedTime elapsedTime = ElapsedTime(
        seconds: seconds,
        minutes: minutes,
      );
      for (final listener in dependencies.timerListeners) {
        listener(elapsedTime);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RepaintBoundary(
          child: SizedBox(
            height: 90.0,
            child: MinutesAndSeconds(dependencies: dependencies),
          ),
        ),
      ],
    );
  }
}


