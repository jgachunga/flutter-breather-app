import 'package:flutter/cupertino.dart';

import 'minutes_and_seconds.dart';

class TimerTextWidget extends StatelessWidget {
  final timerModel;
  TimerTextWidget({
    Key? key,
    required this.timerModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        RepaintBoundary(
          child: SizedBox(
            height: 90.0,
            child: MinutesAndSecondsText(),
          ),
        ),
      ],
    );
  }
}
