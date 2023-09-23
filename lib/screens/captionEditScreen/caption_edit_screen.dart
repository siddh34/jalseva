import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jalseva/screens/postScreen/post_screen_controller.dart';

class CaptionEditScreen extends StatefulWidget {
  const CaptionEditScreen({Key? key}) : super(key: key);
  @override
  _CaptionEditScreenState createState() => _CaptionEditScreenState();
}

class _CaptionEditScreenState extends State<CaptionEditScreen> {
  final _formKey = GlobalKey<FormState>();

  late PostScreenController controller = Get.find<PostScreenController>();
  late TextEditingController captionController;
  
  @override
  void initState() {
    super.initState();
    captionController = TextEditingController(text: controller.caption.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Caption'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              FocusScope.of(context).unfocus();
              controller.caption.value = captionController.text;
              if (_formKey.currentState!.validate()) {
                // add timeout of 2 seconds
                Future.delayed(Duration(seconds: 2), () {
                  Get.back();
                });
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: captionController,
                decoration: InputDecoration(
                  labelText: 'Caption',
                  hintText: 'Enter a caption',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a caption';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
