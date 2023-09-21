import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../components/image_viewer_post_screen.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  File? _imageFile;

  Future<void> _showBottomSheet() async {
    final result = await showModalBottomSheet<int>(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take Photo'),
              onTap: () {
                Navigator.pop(context, 0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () {
                Navigator.pop(context, 1);
              },
            ),
          ],
        );
      },
    );

    if (result == null) {
      return;
    }

    final picker = ImagePicker();
    final pickedFile = result == 0
        ? await picker.pickImage(source: ImageSource.camera)
        : await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImagePreviewScreen(imageFile: _imageFile!,onRetake: _showBottomSheet,),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Screen'),
      ),
      body: Center(
        child: _imageFile == null
            ? const Text('No image selected')
            : Image.file(_imageFile!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showBottomSheet,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ImagePreviewScreen extends StatelessWidget {
  const ImagePreviewScreen({Key? key, required this.imageFile, required this.onRetake})
      : super(key: key);

  final File imageFile;
  final Function onRetake;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Preview'),
      ),
      body: Center(
        child: ImageViewerPost(imageFile: imageFile,onRetake: onRetake,),
      ),
    );
  }
}
