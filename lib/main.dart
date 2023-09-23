import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jalseva/my_bindings.dart';
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

    return GetMaterialApp(
      routes: {
        '/splash': (context) => SplashScreen(),
        "/": (context) => MainScreen(),
        "/Post": (context) => PostScreen(),
        "/Login": (context) => LoginScreen(),
        "/Signup": (context) => SignupScreen(),
      },
      initialBinding: MyBindings(),
      title: 'Jalseva',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF191919),
        appBarTheme: const AppBarTheme(
          backgroundColor: const Color(0xFF191919),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
    );
  }
}