import 'package:flutter_demo_app/core/enums/session_state.dart';

class BreathSessionStateUpdater {
  BreathSessionStateUpdater();

  double getDiameter(SessionState state) {
    switch (state) {
      case SessionState.Initial:
        return  200;
      case SessionState.Starting:
        return  100;
      case SessionState.BreathingIn:
        return  200;
      case SessionState.BreathingOut:
        return 100;
      case SessionState.HoldBreathIn:
        return 200;
      case SessionState.HoldBreathOut:
        return 100;
      case SessionState.Ended:
        return 200;
      default:
        return 5;
    }
  }
  String getInstructionText(SessionState state){
    switch (state) {
      case SessionState.Initial:
        return "Start";
      case SessionState.Starting:
        return "Get Ready...";
      case SessionState.BreathingIn:
        return "Breathe in Slowly";
      case SessionState.BreathingOut:
        return "Breathe out Slowly";
      case SessionState.HoldBreathIn:
      case SessionState.HoldBreathOut:
        return "Hold";
      case SessionState.Ended:
        return "";
      default:
        return "INVALID STATE";
    }
  }
  String getCountDownText(SessionState state, countDown) {
    switch (state) {
      case SessionState.Initial:
        return 'Start';
      case SessionState.Ended:
        return 'Hooray';
      default:
        return '$countDown';
    }
  }
  nextState(SessionState state) {
    switch (state) {
      case SessionState.Initial:
        return SessionState.Starting;
      case SessionState.Starting:
        return SessionState.BreathingIn;
      case SessionState.BreathingIn:
        return SessionState.HoldBreathIn;
      case SessionState.BreathingOut:
        return SessionState.HoldBreathOut;
      case SessionState.HoldBreathIn:
        return SessionState.BreathingOut;
      case SessionState.HoldBreathOut:
        return SessionState.BreathingIn;
      case SessionState.Ended:
        return SessionState.Ended;
      default:
        return SessionState.Invalid;
    }
  }
  getDisplayText(SessionState state){
    switch (state) {
      case SessionState.Initial:
        return "Get Ready";
      case SessionState.Starting:
        return "Breathe in Slowly";
      case SessionState.BreathingIn:
        return "Hold Breath";
      case SessionState.BreathingOut:
        return "Hold Breath";
      case SessionState.HoldBreathIn:
        return "Breathe out Slowly";
      case SessionState.HoldBreathOut:
        return "Breathe in Slowly";
      case SessionState.Ended:
        return "";
      case SessionState.Invalid:
        return "";
    }
  }
}