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
          Text(
            "Welcome To My Blog",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SvgPicture.asset(
            "assets/icons/chat.svg",
            height: size.height * 0.4,
          ),
          RoundedButton(
            text: "deneme",
            press: nothing,
            color: kPrimaryColor,
          )
        ],
      ),
    );
  }
}

void nothing(params) {}
