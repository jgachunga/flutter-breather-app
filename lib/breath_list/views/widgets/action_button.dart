//returns the action button based on session state

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_app/breath_list/view_models/breath_view_model.dart';
import 'package:flutter_demo_app/breath_list/views/pages/breath_history_page.dart';
import 'package:flutter_demo_app/core/enums/session_state.dart';
import 'package:provider/src/provider.dart';

class ActionButtonWidget extends StatelessWidget {
  const ActionButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BreathHistoryViewModel breathHistoryViewModel =
    context.watch<BreathHistoryViewModel>();
    if (breathHistoryViewModel.sessionState == SessionState.Initial) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          margin: const EdgeInsets.all(25.0),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                primary: Colors.red, // background
                onPrimary: Colors.white, // foreground
                fixedSize: const Size(50, 45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0))),
            label: const Text('Breathing History',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                )),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BreathHistoryPage()));
            },
            icon: const Icon(Icons.list),
          ),
        ),
      );

      //Else show stop button
    } else if (breathHistoryViewModel.sessionState == SessionState.Ended) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          margin: const EdgeInsets.all(25.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.red, // background
                onPrimary: Colors.white, // foreground
                fixedSize: const Size(50, 45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0))),
            child: const Text('Start',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                )),
            onPressed: () => breathHistoryViewModel.reset(),
          ),
        ),
      );
    } else {
      return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              margin: const EdgeInsets.all(25.0),
              child: Wrap(
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white, // background
                        onPrimary: Colors.red, // foreground
                        fixedSize: const Size(50, 45),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    onPressed: () => Navigator.pop(context),
                    child: const Icon(Icons.refresh),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red, // background
                        onPrimary: Colors.white, // foreground
                        fixedSize: const Size(200, 45),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    label: const Text('Stop',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        )),
                    onPressed: () => breathHistoryViewModel.stop(),
                    icon: const Icon(Icons.stop),
                  ),
                ],
              )));
    }
  }

}