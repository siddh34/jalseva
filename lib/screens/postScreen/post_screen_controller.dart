import 'package:get/get.dart';

class PostScreenController extends GetxController {
  late RxString caption = ''.obs;

  String get captionText => caption.value;
  set captionText(String value) => caption.value = value;

  Future<void> getValueForCaption(String values) async {
    caption.value = values;
  }
}
