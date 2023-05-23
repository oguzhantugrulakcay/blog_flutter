import 'package:blog_flutter/Screens/SignUp/components/background.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return const Scaffold(
      body: Background(
        child: Body(),
      ),
    );
  }
}
