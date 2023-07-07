import 'package:get/get.dart';
import 'package:flutter/material.dart';

// class controller untuk reset password
class ResetPasswordController extends GetxController {
TextEditingController emailC = TextEditingController();

  @override
  void onClose() {
    emailC.dispose();

    super.onClose();
  }
}
