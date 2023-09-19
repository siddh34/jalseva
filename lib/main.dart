// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jalseva/screens/splashScreen/splash_screen.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jalseva',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}
