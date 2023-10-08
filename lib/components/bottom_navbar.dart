import 'package:flutter/material.dart';
import 'package:jalseva/screens/postScreen/post_screen.dart';
import 'package:jalseva/screens/profileScreen/profile_screen.dart';

class JalShaktiBottomNavigationBar extends StatefulWidget {
  const JalShaktiBottomNavigationBar({Key? key});

  @override
  State<JalShaktiBottomNavigationBar> createState() =>
      _JalShaktiBottomNavigationBarState();
}

class _JalShaktiBottomNavigationBarState
    extends State<JalShaktiBottomNavigationBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Map',
      style: optionStyle,
    ),
    Text(
      'Index 1: Search',
      style: optionStyle,
    ),
    Text(
      'Index 2: Home',
      style: optionStyle,
    ),
    PostScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add_rounded),
            label: 'POST',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}