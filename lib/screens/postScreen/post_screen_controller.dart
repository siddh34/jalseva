import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostScreenController extends GetxController {
  late var captionController = TextEditingController().obs;

  Future<void> getValueForController(String values) async {
    captionController.value.text = values;
  }
}
