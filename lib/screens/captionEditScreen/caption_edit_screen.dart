import 'package:flutter/material.dart';

class CaptionEditScreen extends StatefulWidget {
  const CaptionEditScreen({Key? key}) : super(key: key);

  @override
  _CaptionEditScreenState createState() => _CaptionEditScreenState();
}

class _CaptionEditScreenState extends State<CaptionEditScreen> {
  final _formKey = GlobalKey<FormState>();
  final _captionController = TextEditingController();

  @override
  void dispose() {
    _captionController.dispose();
    super.dispose();
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
              // Save the caption and go back to the previous screen
              Navigator.pop(context, _captionController.text);
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
                controller: _captionController,
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
