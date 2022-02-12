import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_app/breath_list/views/pages/breath_page.dart';
import 'package:flutter_demo_app/constants/constant.dart';
import 'package:flutter_demo_app/constants/validator.dart';
import 'package:flutter_demo_app/models/auth.dart';
import 'package:flutter_demo_app/models/breathe_history.dart';

import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_demo_app/utils/dio_client.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<Signin> {
  final DioClient _dioClient = DioClient();

  bool _visible = true;
  bool isFetching = false;
  final _emailTextController = TextEditingController(text: "");
  final _passwordTextController = TextEditingController(text: "");
  late Future<List<BreatheHistory>> breatheHistory;

  @override
  void initState() {
    super.initState();
    // dbHelper = DBHelper();
  }

  @override
  void dispose() {
    // dbHelper!.close();
    super.dispose();
  }

  Future<void> checkUserDataValidation(String userName, String password) async {
    if (userName.isEmpty) {
      showSimpleNotification(const Text("Email is required"),
          background: tostErrorMessageRed);
      return;
    } else if (!Validator.validateEmail(userName)) {
      showSimpleNotification(const Text("Email Validation faild"),
          background: tostErrorMessageRed);
      return;
    } else if (password.isEmpty) {
      showSimpleNotification(const Text("Password is required"),
          background: tostErrorMessageRed);
      return;
    }

    EasyLoading.show();
    Auth? retrievedUser =
        await _dioClient.createUser(username: userName, password: password);
    EasyLoading.dismiss();
    print(retrievedUser);

    if (retrievedUser?.token != null) {
      print("Login Success!");
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userName', userName);
      prefs.setBool('loggedIn', true);
      prefs.setString('token', retrievedUser?.token ?? "");

      //Navigate to mainview
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const BreathPageScreen()));
    } else {
      showSimpleNotification(const Text("Incorrect username or password."),
          background: tostErrorMessageRed);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: blue,
          ),
          // const TopSginin(),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.10,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: whiteshade,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    height: 250,
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.09),
                    child: Image.asset("assets/images/login.png"),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 10,
                        ),
                        child: const Text(
                          "Username",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                            color: grayshade.withOpacity(0.5),
                            // border: Border.all(
                            //   width: 1,
                            // ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailTextController,
                              decoration: const InputDecoration(
                                hintText: "Username",
                                border: InputBorder.none,
                              ),
                            ),
                          )
                          //IntrinsicHeight
                          ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 10,
                        ),
                        child: const Text(
                          "Password",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                          color: grayshade.withOpacity(0.5),
                          // border: Border.all(
                          //   width: 1,
                          // ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: _passwordTextController,
                            obscureText: _visible,
                            decoration: InputDecoration(
                                hintText: "At least 8 Charecter",
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                    icon: Icon(_visible
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        _visible = !_visible;
                                      });
                                    })),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CheckerBox(),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: blue.withOpacity(0.7),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      print("Sign up button click");
                      checkUserDataValidation(_emailTextController.text,
                          _passwordTextController.text);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.07,
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                          color: blue,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: whiteshade),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.149,
                        top: MediaQuery.of(context).size.height * 0.08),
                    child: Text.rich(
                      TextSpan(
                          text: "Don't already Have an account? ",
                          style: TextStyle(
                              color: grayshade.withOpacity(0.8), fontSize: 16),
                          children: [
                            TextSpan(
                                text: "Sign Up",
                                style: TextStyle(color: blue, fontSize: 16),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print("Sign Up click");
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             const BreatheScreen()));
                                  }),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class CheckerBox extends StatefulWidget {
  const CheckerBox({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckerBox> createState() => _CheckerBoxState();
}

class _CheckerBoxState extends State<CheckerBox> {
  bool? isCheck;
  @override
  void initState() {
    // TODO: implement initState
    isCheck = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
              value: isCheck,
              checkColor: whiteshade, // color of tick Mark
              activeColor: blue,
              onChanged: (val) {
                setState(() {
                  isCheck = val!;
                  print(isCheck);
                });
              }),
          Text.rich(
            TextSpan(
              text: "Remember me",
              style: TextStyle(color: grayshade.withOpacity(0.8), fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class TopSginin extends StatelessWidget {
  const TopSginin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.arrow_back_sharp,
            color: whiteshade,
            size: 40,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            "Sign In",
            style: TextStyle(color: whiteshade, fontSize: 25),
          )
        ],
      ),
    );
  }
}
