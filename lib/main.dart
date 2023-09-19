// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jalseva/screens/SignupScreen/signup_screen_controller.dart';
import 'package:jalseva/screens/loginScreen/login_screen_controller.dart';
import 'package:jalseva/screens/mainScreen/main_screen_controller.dart';
import 'package:jalseva/screens/postScreen/post_screen_controller.dart';
import 'package:jalseva/screens/splashScreen/splash_screen.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/splash': (context) => SplashScreen(),
        "/":(context) =>  MainScreen(),
        "/Post": (context) => PostScreen(),
        "/Login": (context) => LoginScreen(),
        "/Signup": (context) => SignupScreen(),
      },
      title: 'Jalseva',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash'
    );
  }
}
