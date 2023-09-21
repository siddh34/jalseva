import 'dart:io';
import 'package:flutter/material.dart';

class ImageViewerPost extends StatefulWidget {
  const ImageViewerPost(
      {Key? key, required this.imageFile, required this.onRetake})
      : super(key: key);

  final File imageFile;
  final Function onRetake;

  @override
  _ImageViewerPostState createState() => _ImageViewerPostState();
}

class _ImageViewerPostState extends State<ImageViewerPost> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.file(widget.imageFile),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FloatingActionButton(
              onPressed: () {
                // Handle retake button press
                widget.onRetake();
              },
              child: const Icon(Icons.camera_alt),
            ),
          ),
        ),
      ],
    );
  }
}
