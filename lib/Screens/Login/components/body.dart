import 'dart:developer';

import 'package:blog_flutter/Screens/Home/home_screen.dart';
import 'package:blog_flutter/Screens/SignUp/sign_up_screen.dart';
import 'package:blog_flutter/components/rounded_button.dart';
import 'package:blog_flutter/controllers/homeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../components/already_have_account_check.dart';
import '../../../components/rounded_input_field.dart';
import '../../../components/rounded_password_field.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String mail = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/login.svg",
          ),
          RoundedInputField(
            hitText: "Please enter yor mail",
            icon: Icons.alternate_email,
            onChange: ((value) {
              setState(() {
                mail = value;
              });
            }),
          ),
          RoundedPasswordField(
            onChange: (value) {
              setState(() {
                password = value;
              });
            },
          ),
          RoundedButton(
              text: "Login",
              press: (() async {
                var result = await loginBlog(mail, password);
                if (!result) {
                  AlertDialog(
                    title: const Text("Wrong mail or password"),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Ok"))
                    ],
                  );
                } else {
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const HomeScreen())));
                }
              })),
          SizedBox(
            height: size.height * 0.03,
          ),
          AlreadyHaveAccountCheck(
            onPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const SignUpScreen())));
            },
          )
        ],
      ),
    );
  }
}
