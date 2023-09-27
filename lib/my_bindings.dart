import 'package:get/get.dart';
import 'package:jalseva/screens/captionEditScreen/caption_edit_controller.dart';
import 'package:jalseva/screens/editProfileScreen/edit_profile_controller.dart';
import 'package:jalseva/screens/mainScreen/main_screen_controller.dart';
import 'package:jalseva/screens/postScreen/post_screen_controller.dart';
import 'package:jalseva/screens/profileScreen/profile_screen_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(PostScreenController());

    Get.put(ProfileScreenController());

    Get.put(MainScreenController());

    Get.put(CaptionEditController());

    Get.put(EditProfileController());
  }
}
