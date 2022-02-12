import 'package:flutter/material.dart';

Widget customButton(BuildContext context,
    {required String text,
    VoidCallback? onPressed,
    Color textColors = Colors.black,
    Color backgroundColor = Colors.red,
    BorderRadius radius = BorderRadius.zero,
    double paddingVertical = 20.0,
    double paddingHorizontal = 20.0}) {
  return SizedBox(
    height: 60.0,
    child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            shadowColor: MaterialStateProperty.all(backgroundColor),
            elevation: MaterialStateProperty.all(8),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )))),
  );
}
