import 'package:flutter/material.dart';
import 'package:jalseva/components/bottom_navbar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Main Screen'),
        ),
        bottomNavigationBar: JalShaktiBottomNavigationBar(),
      );
  }
}