import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PostScreenController extends GetxController {
  TextEditingController captionController = TextEditingController();

  Future<void> getValueForController(String value) async {
    captionController.text = value;
  }
}