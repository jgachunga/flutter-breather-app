import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_demo_app/breath_list/views/pages/breath_history_page.dart';
import 'package:flutter_demo_app/breath_list/views/pages/breath_page.dart';
import 'package:flutter_demo_app/constants/constant.dart';
import 'package:flutter_demo_app/screens/signin.dart';
import 'package:flutter_demo_app/utils/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'new_screens/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String splashRoute = '/';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void timeToShowSplashScreenOnScreen() async {
    Timer(const Duration(seconds: 2), () async {
      if (!mounted) return;
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      bool? isLoggedIn = _prefs.getBool("loggedIn");
      print(isLoggedIn);
      if (isLoggedIn != null && isLoggedIn) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BreathPageScreen()));
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BreathPageScreen()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    timeToShowSplashScreenOnScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightblueshade,
      body: const Center(
        child: Text(
          "BREATHING APP",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
