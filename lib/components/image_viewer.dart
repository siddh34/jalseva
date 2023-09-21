// create a image viewer component

import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({Key? key, required this.imagePath}) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}