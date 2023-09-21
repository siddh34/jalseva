import 'package:flutter/material.dart';
import 'package:jalseva/screens/SignupScreen/signup_screen.dart';
import 'package:jalseva/screens/loginScreen/login_screen.dart';
import 'package:jalseva/screens/mainScreen/main_screen.dart';
import 'package:jalseva/screens/postScreen/post_screen.dart';
import 'package:jalseva/screens/splashScreen/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/splash': (context) => SplashScreen(),
        "/": (context) => MainScreen(),
        "/Post": (context) => PostScreen(),
        "/Login": (context) => LoginScreen(),
        "/Signup": (context) => SignupScreen(),
      },
      title: 'Jalseva',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.grey,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
    );
  }
}