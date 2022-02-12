import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo_app/breath_list/models/breath_history_model.dart';
import 'package:flutter_demo_app/breath_list/models/elapsed_time.dart';
import 'package:flutter_demo_app/breath_list/models/timer_model.dart';
import 'package:flutter_demo_app/breath_list/repo/breath_service.dart';
import 'package:flutter_demo_app/core/enums/session_state.dart';
import 'package:flutter_demo_app/helpers/breath_session_state_updater.dart';

class BreathHistoryViewModel extends ChangeNotifier {
  bool _loading = false;
  List<BreatheHistory> _breathHistoryModelList = [];
  BreatheHistory? _selectedBreathSession;
  BreatheHistory _addingBreathSession = BreatheHistory();
  final BreathService breathService;
  BreathSessionStateUpdater breathSessionStateUpdater;
  var selected = false;
  var sessionState = SessionState.Initial;
  final TimerModel timerModel = TimerModel();
  final oneSec = const Duration(seconds: 1);
  var countDownText = "";

  String? display;
  int countDown = 0;
  int duration = 5;
  int minutes = 0;
  int seconds = 0;
  Timer? countDownTimer;
  int milliseconds = 1000;
  Timer? sumTimer;

  var goUp = false;

  bool get loading => _loading;
  List<BreatheHistory> get breathHistoryModelList => _breathHistoryModelList;
  BreatheHistory? get selectedBreathSession => _selectedBreathSession;
  BreatheHistory get addingBreathSession => _addingBreathSession;

  BreathHistoryViewModel({required this.breathService, required this.breathSessionStateUpdater});

  start() {
    goUp = !goUp;
    selected = !selected;
    timerModel.stopwatch.start();
    beginExerciseRoutine();
    notifyListeners();
  }

  stop() {
    timerModel.stopwatch.stop();
    sessionState = SessionState.Ended;
    countDownTimer?.cancel();
    sumTimer?.cancel();
    countDown = 0;
    nextState(sessionState);
    notifyListeners();

    final breatheData = BreatheHistory(
        id: null,
        elapsedMinutes: timerModel.minutes,
        elapsedSeconds: timerModel.seconds,
        intervals: null,
        createdAt: DateTime.now());

    addBreathSession(breatheData);
  }

  reset() {
    timerModel.stopwatch.reset();
    sessionState = SessionState.Initial;
    countDown = 0;
    notifyListeners();
  }

  setCounter(value) {
    duration = value;
    start();
  }

  beginExerciseRoutine() {
    sessionState = nextState(sessionState);
    countDown = duration;
    countDownTimer = Timer.periodic(oneSec, (timer) {
      //Decrement the countDown
      countDown--;
      if (countDown < 0) {
        countDown = duration;
        sessionState = nextState(sessionState);
      }
      notifyListeners();
    });
    startTotalDurationTimer();
  }

  SessionState nextState(SessionState state) {
    SessionState next;
    next = breathSessionStateUpdater.nextState(state);
    countDownText = breathSessionStateUpdater.getDisplayText(state);
    notifyListeners();
    return next;
  }

  String instructionText(SessionState state) {
    return breathSessionStateUpdater.getInstructionText(state);
  }

  String getCountDownText() {
    SessionState state = sessionState;
    return breathSessionStateUpdater.getCountDownText(state, countDown);
  }

  double getDiameter() {
    SessionState state = sessionState;
    return breathSessionStateUpdater.getDiameter(state);
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setBreathHistoryListModel(List<BreatheHistory> breathHistoryModelList) {
    _breathHistoryModelList = breathHistoryModelList;
    notifyListeners();
  }

  setSelectedSession(BreatheHistory breatheHistory) {
    _selectedBreathSession = breatheHistory;
  }

  addBreathSession(breatheHistory) async {
    await breathService.add(breatheHistory);
    _addingBreathSession = BreatheHistory();
    notifyListeners();
    return true;
  }

  Future<void> getBreathingHistory() async {
    var list = await breathService.list();
    setBreathHistoryListModel(list);
  }

  startTotalDurationTimer(){
    timerModel.timerListeners.add(onTick);
    sumTimer = Timer.periodic(
        Duration(milliseconds: timerModel.timerMillisecondsRefreshRate),
        callback);
  }
  void callback(Timer timer) {
    if (milliseconds != timerModel.stopwatch.elapsedMilliseconds) {
      milliseconds = timerModel.stopwatch.elapsedMilliseconds;
      final int hundreds = (milliseconds / 10).truncate();
      final int seconds = (hundreds / 100).truncate();
      final int minutes = (seconds / 60).truncate();

      final ElapsedTime elapsedTime = ElapsedTime(
        seconds: seconds,
        minutes: minutes,
      );
      for (final listener in timerModel.timerListeners) {
        listener(elapsedTime);
      }
    }
  }

  void onTick(ElapsedTime elapsed) {
    if (elapsed.minutes != minutes || elapsed.seconds != seconds) {
        minutes = elapsed.minutes;
        seconds = elapsed.seconds;

        timerModel.minutes = elapsed.minutes;
        timerModel.seconds = elapsed.seconds;
        notifyListeners();
    }
  }
}
