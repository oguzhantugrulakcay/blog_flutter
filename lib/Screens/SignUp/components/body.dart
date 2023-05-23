import 'dart:developer';

import 'package:blog_flutter/Screens/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/already_have_account_check.dart';
import '../../../components/rounded_button.dart';
import '../../../components/rounded_input_field.dart';
import '../../../components/rounded_password_field.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String mail = "";
    String password = "";
    String repassword = "";
    final _formKey = GlobalKey<FormState>();
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/signup.svg"),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hitText: "Please enter your mail",
                icon: Icons.alternate_email,
                onChange: (value) {
                  mail = value;
                },
              ),
              RoundedPasswordField(
                onChange: (value) {
                  password = value;
                },
              ),
              RoundedPasswordField(
                onChange: (value) {
                  repassword = value;
                },
              ),
              SizedBox(height: size.height * 0.03),
              RoundedButton(
                  text: "Sign Up",
                  press: () {
                    log('$mail|$password|$repassword');
                  }),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAccountCheck(
                onPress: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const LoginScreen())));
                }),
                login: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
