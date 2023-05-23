import 'package:blog_flutter/Screens/Login/login_screen.dart';
import 'package:blog_flutter/Screens/Welcome/components/background.dart';
import 'package:blog_flutter/constraints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/rounded_button.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Welcome To My Blog",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SvgPicture.asset(
            "assets/icons/chat.svg",
            height: size.height * 0.4,
          ),
          SizedBox(height: size.height * 0.03),
          RoundedButton(
            text: "Login",
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const LoginScreen())));
            },
            color: kPrimaryColor,
          ),
          SizedBox(height: size.height * 0.01),
          RoundedButton(
            text: "Register",
            press: () {},
            color: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
