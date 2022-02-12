import 'package:flutter/material.dart';
import 'package:flutter_demo_app/utils/size_config.dart';
import 'package:flutter_demo_app/widgets/custom_button.dart';
import 'package:flutter_demo_app/widgets/custom_text_field.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _userNameTextController = TextEditingController(text: "");
  final _passwordTextController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color(0xff7D8AFF),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/signin_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 39, right: 39),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: getRelativeHeight(0.30),
                  ),
                  const Text(
                    "Login",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                  SizedBox(
                    height: getRelativeHeight(0.085),
                  ),
                  textFieldLabel("Username"),
                  Container(
                      margin: const EdgeInsets.only(top: 12),
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: CustomTextField(
                        baseColor: Colors.transparent,
                        borderColor: Colors.white,
                        controller: _userNameTextController,
                        hint: "Username",
                        inputType: TextInputType.text,
                        obscureText: false,
                        leftIcon: Icons.lock_outline,
                        onChanged: (content) {
                          // print(content);
                        },
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  textFieldLabel("Password"),
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: CustomTextField(
                      baseColor: Colors.transparent,
                      borderColor: Colors.white,
                      controller: _passwordTextController,
                      hint: "password",
                      inputType: TextInputType.text,
                      obscureText: true,
                      leftIcon: Icons.remove_red_eye,
                      onChanged: (content) {
                        // print(content);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: customButton(context,
                        text: "Sign In",
                        backgroundColor: const Color(0xffFC4848),
                        paddingVertical: 10,
                        paddingHorizontal: 0,
                        onPressed: () {}),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    onTap: () {
                      print('Forgotted Password?');
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getRelativeHeight(0.075),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '''Don't have an account? ''',
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400),
                      ),
                      InkWell(
                        onTap: () {
                          print("Signup tapped");
                        },
                        child: const Text(
                          "Sign up",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textFieldLabel(textValue) => Text(
        textValue,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Color(0xffFFFFFF),
        ),
      );
}
