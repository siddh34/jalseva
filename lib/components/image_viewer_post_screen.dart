import 'package:flutter/material.dart';

class ImageViewerPost extends StatefulWidget {
  const ImageViewerPost({Key? key, required this.imagePath}) : super(key: key);

  final String imagePath;

  @override
  _ImageViewerPostState createState() => _ImageViewerPostState();
}

class _ImageViewerPostState extends State<ImageViewerPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(widget.imagePath),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                onPressed: () {
                  // Handle retake button press
                },
                child: const Icon(Icons.camera_alt),
              ),
            ),
          ),
        ],
      ),
    );
  }
}