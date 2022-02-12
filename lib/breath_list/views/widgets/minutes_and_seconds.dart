import 'package:flutter/cupertino.dart';
import 'package:flutter_demo_app/breath_list/view_models/breath_view_model.dart';
import 'package:provider/src/provider.dart';

class MinutesAndSecondsText extends StatelessWidget {

  const MinutesAndSecondsText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    BreathHistoryViewModel breathHistoryViewModel =
    context.watch<BreathHistoryViewModel>();
    String minutesStr = (breathHistoryViewModel.timerModel.minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (breathHistoryViewModel.timerModel.seconds % 60).toString().padLeft(2, '0');
    return Text('$minutesStr:$secondsStr', style: breathHistoryViewModel.timerModel.textStyle);
  }
}