import 'package:get/get.dart';

class PostScreenController extends GetxController {
  late RxString caption = ''.obs;

  // Getter for the caption text
  String get captionText => caption.value;

  // Setter for the caption text
  set captionText(String value) => caption.value = value;

  Future<void> getValueForCaption(String values) async {
    caption.value = values;
  }
}
