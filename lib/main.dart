import 'package:flutter/material.dart';
import 'package:tiktok/constants.dart';
import 'package:tiktok/view/screens/auth/signup_screen.dart';
import 'package:tiktok/view/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TikTok',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor,
        ),
        home: SignupScreen());
  }
}
