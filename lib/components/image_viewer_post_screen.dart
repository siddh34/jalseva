import 'dart:io';
import 'package:flutter/material.dart';

class ImageViewerPost extends StatefulWidget {
  const ImageViewerPost({
    Key? key,
    required this.imageFile,
    required this.onRetake,
    this.width = 320,
    this.height = 310,
    this.borderRadius = 16,
  }) : super(key: key);

  final File imageFile;
  final Function onRetake;
  final double width;
  final double height;
  final double borderRadius;

  @override
  _ImageViewerPostState createState() => _ImageViewerPostState();
}

class _ImageViewerPostState extends State<ImageViewerPost> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            child: Image.file(
              widget.imageFile,
              width: widget.width,
              height: widget.height,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: GestureDetector(
              onTap: () {
                widget.onRetake();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF191919),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: const Text(
                  'Retake',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
