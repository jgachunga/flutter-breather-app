import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_demo_app/breath_list/models/breath_history_model.dart';

class BreathCardWidget extends StatelessWidget {
  var breathHistory;

  BreathCardWidget({
    Key? key,
    required this.index,
    required this.breatheHistory,
  }) : super(key: key);

  final BreatheHistory breatheHistory;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: const Color(0xff6572E3),
        child: Container(
          padding: const EdgeInsets.all(8),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          breatheHistory.createdAt != null
                              ? DateFormat('hh:mm a')
                                  .format(breatheHistory.createdAt!)
                              : "",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          breatheHistory.createdAt != null
                              ? DateFormat.EEEE()
                                  .format(breatheHistory.createdAt!)
                              : "",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Min  ",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      "${breatheHistory.elapsedMinutes.toString()} :",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sec",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      "${breatheHistory.elapsedSeconds.toString()}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ]),
        ));
  }
}
