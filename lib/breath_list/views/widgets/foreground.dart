import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_app/breath_list/view_models/breath_view_model.dart';
import 'package:flutter_demo_app/breath_list/views/widgets/timer.dart';
import 'package:flutter_demo_app/core/enums/session_state.dart';
import 'package:provider/src/provider.dart';

import 'modal_bottom_sheet.dart';

class ForegroundWidget extends StatelessWidget {
  const ForegroundWidget({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    BreathHistoryViewModel breathHistoryViewModel =
    context.watch<BreathHistoryViewModel>();

    onTapCallBack(breathTime) {
      breathHistoryViewModel.setCounter(breathTime);
      Navigator.pop(context);
    }

    breathHistoryViewModel.display ??= 'Get ready';
    return Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: AnimatedContainer(
              duration: Duration(seconds: breathHistoryViewModel.duration),
              width: 500,
              height: 275,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                displayModalBottomSheet(
                                    context, breathHistoryViewModel.sessionState,
                                    (breathTime) => {onTapCallBack(breathTime)}
                                );
                              },
                              child: AnimatedContainer(
                                duration: Duration(
                                    seconds: breathHistoryViewModel.duration),
                                width: breathHistoryViewModel.getDiameter(),
                                height: breathHistoryViewModel.getDiameter(),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Visibility(
                                          visible:
                                          breathHistoryViewModel.sessionState ==
                                              SessionState.Ended,
                                          child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: const [
                                                Image(
                                                    image: AssetImage(
                                                        'assets/hooray.png')),
                                                SizedBox(height: 10)
                                              ])),
                                      Text(
                                        breathHistoryViewModel.getCountDownText(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 38,
                                            color: Color(0xff215366)),
                                      )
                                    ]),
                                alignment: Alignment.center,
                              ),
                            ),
                          ])),
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Visibility(
                visible:
                breathHistoryViewModel.sessionState != SessionState.Ended,
                child: TimerTextWidget(
                  timerModel: breathHistoryViewModel.timerModel,
                ),
              )),
        ],
      ),
    );
  }
}

