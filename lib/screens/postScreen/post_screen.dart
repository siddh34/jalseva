import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jalseva/components/location_data_post_screen.dart';
import 'package:jalseva/screens/captionEditScreen/caption_edit_screen.dart';
import '../../components/button.dart';
import '../../components/image_viewer_post_screen.dart';
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
                Get.back(result: 0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () {
                Get.back(result: 1);
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
            LocationDataDisplay(latitude: "12.8998 N",longitude: "72.8998 E",area: "Malojire",city: "Ratnagiri",state: "Maharashtra",country: "India"),
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


