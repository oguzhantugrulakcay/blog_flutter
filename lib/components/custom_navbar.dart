import 'package:blog_flutter/constraints.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../Screens/Welcome/welcome_screen.dart';

class CustomButtomNavBar extends StatelessWidget {
  final int screenIndex;
  const CustomButtomNavBar({
    Key? key,
    required this.screenIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(bottom: size.height * 0.02),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        width: size.width * 0.8,
        height: size.height * 0.09,
        decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                spreadRadius: -10,
                blurRadius: 60,
                color: Colors.black.withOpacity(.4),
                offset: const Offset(0, 25),
              )
            ]),
        child: GNav(
          selectedIndex: screenIndex,
          onTabChange: (index) {
            switch (index) {
              case 0:
                //ProfilePage()
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const WelcomeScreen())));
                break;
              case 1:
//SearcPage
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const WelcomeScreen())));
                break;
              case 3:
//Settings
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const WelcomeScreen())));
                break;
              case 4:
//AddPost
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const WelcomeScreen())));
                break;
              default:
            }
          },
          tabBorderRadius: 15,
          color: Colors.grey,
          activeColor: kPrimaryColor,
          haptic: true,
          tabs: const [
            GButton(icon: Icons.person, text: "Profile"),
            GButton(
              icon: Icons.search,
              text: "Search",
            ),
            GButton(
              icon: Icons.list,
              text: "Posts",
            ),
            GButton(
              icon: Icons.settings,
              text: "Settings",
            ),
            GButton(icon: Icons.add)
          ],
        ),
      ),
    );
  }
}
