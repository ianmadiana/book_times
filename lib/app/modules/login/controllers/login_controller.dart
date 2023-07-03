import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController(text: 'tes@gmail.com');
  TextEditingController passC = TextEditingController(text: '123123');

  @override
  void onClose() {
    // TODO: implement onClose
    emailC.dispose();

    super.onClose();
  }
}
