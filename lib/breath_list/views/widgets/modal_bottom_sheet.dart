import 'package:flutter/material.dart';
import 'package:flutter_demo_app/breath_list/view_models/breath_view_model.dart';
import 'package:flutter_demo_app/breath_list/views/widgets/breath_suggestion_provider.dart';
import 'package:flutter_demo_app/core/enums/session_state.dart';

void displayModalBottomSheet(context, SessionState sessionState, onTapCallBack) {
  if (sessionState != SessionState.Initial) {
    return;
  }
  var listOfBreathTime = BreathSuggestionProvider().listBreathTime(20);

  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18.0)),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.5,
          child: Column(children: <Widget>[
            const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Set Timer Duration',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                )),
            Expanded(
                child: ListView.builder(
                  itemCount: listOfBreathTime.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(listOfBreathTime[index]['timeLabel'] as String,
                          textAlign: TextAlign.center),
                      onTap: () {
                        // breathHistoryViewModel.setCounter(listOfBreathTime[index]['value']);
                        onTapCallBack(listOfBreathTime[index]['value']);
                        // Navigator.pop(context);
                      },
                    );
                  },
                )),

          ]),
        );
      });
}