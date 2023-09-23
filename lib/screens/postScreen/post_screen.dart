import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jalseva/constants/constants.dart';
import 'package:jalseva/screens/captionEditScreen/caption_edit_screen.dart';
import '../../components/button.dart';
import '../../components/image_viewer_post_screen.dart';
import "../../components/TextBox.dart";
import "./post_screen_controller.dart";
import 'package:get/get.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  File? _imageFile;
  PostScreenController controller = Get.put(PostScreenController());

  // initState
  @override
  void initState() {
    super.initState();
    controller.caption.value = "It is a photo";
  }

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

class ImagePreviewScreen extends StatefulWidget {
  ImagePreviewScreen({
    Key? key,
    required this.imageFile,
    required this.onRetake,
    this.firstname = "Aditya",
  }) : super(key: key);

  final File imageFile;
  final Function onRetake;
  final String firstname;

  @override
  State<ImagePreviewScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
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
            Text(widget.firstname),
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
      body: GetBuilder<PostScreenController>(
        builder: (controller) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageViewerPost(
              imageFile: widget.imageFile,
              onRetake: widget.onRetake,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Latitude:",style:reducedTextSize),
                    SizedBox(width: 5),
                    TextBox(value: "12.8998 N"),
                    SizedBox(width: 20),
                    Text("Longitude:",style:reducedTextSize),
                    SizedBox(width: 5),
                    TextBox(value: "72.8998 E"),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text("Area:",style:reducedTextSize),
                    SizedBox(width: 23),
                    TextBox(value: "Malojire"),
                    SizedBox(width: 20),
                    Text("City:",style:reducedTextSize),
                    SizedBox(width: 35),
                    TextBox(value: "Ratnagiri"),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text("State:",style:reducedTextSize),
                    SizedBox(width: 20),
                    TextBox(value: "Maharashtra"),
                    SizedBox(width: 14),
                    Text("Country:",style:reducedTextSize),
                    SizedBox(width: 20),
                    TextBox(value: "India"),
                  ],
                ),
              ],
            ),
            Center(
              child: Text(
                "Auto Generated Caption",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CaptionEditScreen(),
                  ),
                ).then((value) {
                  setState(() {});
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF333333),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 320,
                height: 75,
                child: Center(
                  child: Text(
                    controller.caption.value,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            CommonButton(insideText: 'Upload'),
          ],
        ),
      ),
    );
  }
}
