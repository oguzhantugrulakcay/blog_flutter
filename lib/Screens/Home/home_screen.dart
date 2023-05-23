import 'package:blog_flutter/Screens/Home/components/body.dart';
import 'package:blog_flutter/Screens/Welcome/welcome_screen.dart';
import 'package:blog_flutter/components/custom_navbar.dart';
import 'package:blog_flutter/constraints.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Body(),
        bottomNavigationBar: CustomButtomNavBar(
          screenIndex: 2,
        )
        // drawer: const NavBar(),
        );
  }
}
