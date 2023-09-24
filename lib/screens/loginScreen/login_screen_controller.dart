import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  final _username = ''.obs;
  final _password = ''.obs;
  
  String get password => _password.value;
  set password(String value) => _password.value = value;

  String get username => _username.value;
  set username(String value) => _username.value = value;

  void login() {}
}
