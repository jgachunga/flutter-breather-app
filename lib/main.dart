import 'package:flutter/material.dart';
import 'package:flutter_demo_app/breath_list/view_models/breath_view_model.dart';
import 'package:flutter_demo_app/screens/signin.dart';
import 'package:flutter_demo_app/screens/splash.dart';
import 'package:flutter_demo_app/utils/size_config.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'injection_container.dart';
import 'widgets/custom_animation.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  configLoading();
  init();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 55.0
    ..radius = 15.0
    ..progressColor = Colors.blue
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.blue
    ..textColor = Colors.black
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => sl<BreathHistoryViewModel>()),
      ],
      child: OverlaySupport.global(
        child: MaterialApp(
          // debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen(),
          builder: EasyLoading.init(),
        ),
      ),
    );
  }
}
