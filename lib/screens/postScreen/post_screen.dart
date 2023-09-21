import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../components/image_viewer_post_screen.dart';
import "../../components/TextBox.dart";
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
          builder: (context) => ImagePreviewScreen(
            imageFile: _imageFile!,
            onRetake: _showBottomSheet,
          ),
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
  const ImagePreviewScreen({
    Key? key,
    required this.imageFile,
    required this.onRetake,
    this.firstname = "Aditya",
  }) : super(key: key);

  final File imageFile;
  final Function onRetake;
  final String firstname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/male.png',
              width: 24,
              height: 24,
            ),
            Text(firstname),
            const SizedBox(width: 8),
            Image.asset(
              'assets/title.png',
              width: 100,
              height: 100,
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageViewerPost(
            imageFile: imageFile,
            onRetake: onRetake,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Latitude:"),
                      SizedBox(width: 5),
                      TextBox(value: "12.8998 N"),
                      SizedBox(width: 10),
                      Text("Longitude:"),
                      SizedBox(width: 5),
                      TextBox(value: "72.8998 E"),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text("Area:"),
                      SizedBox(width: 5),
                      TextBox(value: "Malojire"),
                      SizedBox(width: 10),
                      Text("City:"),
                      SizedBox(width: 5),
                      TextBox(value: "Ratnagiri"),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text("State:"),
                      SizedBox(width: 5),
                      TextBox(value: "Maharashtra"),
                      SizedBox(width: 10),
                      Text("Country:"),
                      SizedBox(width: 5),
                      TextBox(value: "India"),
                    ],
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  'Upload',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


