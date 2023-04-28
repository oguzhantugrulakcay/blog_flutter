import 'package:blog_flutter/pages/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Blog',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Colors.white,
        brightness: Brightness.light,
        dividerColor: Colors.white54,
      ),
      darkTheme: ThemeData(
          primarySwatch: Colors.orange,
          primaryColor: Colors.black,
          brightness: Brightness.dark,
          dividerColor: Colors.black12),
      themeMode: ThemeMode.system,
      home: const LoginPage(),
    );
  }
}
