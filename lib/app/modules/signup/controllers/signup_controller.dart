import 'package:get/get.dart';
import 'package:flutter/material.dart';

// class untuk controller signup
class SignupController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();

    super.onClose();
  }
}
