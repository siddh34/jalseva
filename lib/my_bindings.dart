import 'package:get/get.dart';
import 'package:jalseva/screens/postScreen/post_screen_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(PostScreenController());
  }
}
