import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  static const routeName = '/map-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Screen'),
      ),
      body: Center(
        child: Text('Map Screen'),
      ),
    );
  }
}
