import 'package:flutter/material.dart';
import 'elapsed_time.dart';

class TimerModel {
  final List<ValueChanged<ElapsedTime>> timerListeners =
  <ValueChanged<ElapsedTime>>[];
  final TextStyle textStyle = const TextStyle(
      fontSize: 40.0, fontFamily: "Bebas Neue", color: Colors.white);
  final Stopwatch stopwatch = Stopwatch();
  final int timerMillisecondsRefreshRate = 30;
  var minutes = 0;
  var seconds = 0;
}