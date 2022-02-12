import 'package:flutter/material.dart';
import 'package:flutter_demo_app/breath_list/view_models/breath_view_model.dart';
import 'package:flutter_demo_app/breath_list/views/widgets/action_button.dart';
import 'package:flutter_demo_app/breath_list/views/widgets/foreground.dart';
import 'package:provider/src/provider.dart';

class BreathPageScreen extends StatefulWidget {
  const BreathPageScreen({Key? key}) : super(key: key);

  @override
  _BreathPageScreenState createState() => _BreathPageScreenState();
}

class _BreathPageScreenState extends State<BreathPageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BreathHistoryViewModel breathHistoryViewModel =
        context.watch<BreathHistoryViewModel>();

    return Scaffold(
      backgroundColor: const Color(0xff7D8AFF),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 6),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/Mask Group.png'),
          ),
        ),
        title: Container(
          margin: const EdgeInsets.only(top: 12),
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Hello!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Nathan Evans",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.settings),
          ),
        ],
        backgroundColor: Colors.transparent,
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/start_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 140),
                child: Text(
                  breathHistoryViewModel.countDownText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 38,
                    color: Colors.white,
                  ),
                )),
            const ForegroundWidget(),
            //everything in the foreground
          ],
        ),
      ),
      floatingActionButton: const ActionButtonWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
