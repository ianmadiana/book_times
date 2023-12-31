import 'package:book_times/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  ResetPasswordView({Key? key}) : super(key: key);
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reset Password',
          style: TextStyle(fontFamily: 'chomsky'),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // widget kolom untuk membungkus gambar dan input text email dan password
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                // widget gambar
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: SizedBox(
                    height: 100,
                    child: Image.asset('assets/icons/seeds.png'),
                  ),
                ),
              ),
              // widget container untuk membungkus "Login"
              Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    "Input your email",
                    style: TextStyle(fontFamily: 'ConcertOne', fontSize: 30),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                // widget textfield untuk memasukkan input email
                child: TextField(
                  controller: controller.emailC,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsetsDirectional.symmetric(horizontal: 10),
                    prefixIcon: Icon(Icons.alternate_email_rounded),
                    labelText: "Email",
                    hintText: "Email ID",
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(20),
              //   // widget textfield untuk memasukkan input password
              //   child: TextField(
              //     // controller input form email dan password
              //     // controller: controller.passC,
              //     // obscureText: _obscureText,
              //     decoration: const InputDecoration(
              //       contentPadding:
              //           EdgeInsetsDirectional.symmetric(horizontal: 10),
              //       prefixIcon: Icon(Icons.lock),
              //       labelText: 'Password',
              //       // suffixIcon: IconButton(
              //       // icon: Icon(_obscureText
              //       //     ? Icons.visibility
              //       //     : Icons.visibility_off),
              //       // onPressed: () => null,
              //       // onPressed: _toggleObscureText,
              //       // ),
              //     ),
              //   ),
              // ),
              // widget text untuk 'forgot password'
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 30),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       TextButton(
              //         onPressed: () {
              //           // Get.toNamed(Routes.RESET_PASSWORD);
              //         },
              //         child: Text(
              //           'Forgot Password?',
              //           style: TextStyle(
              //             color: Colors.blue[900],
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              // fungsi reset password dengan paramaeter email
              onPressed: () => authC.resetPassword(controller.emailC.text),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsetsDirectional.symmetric(
                  vertical: 20,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text("Reset",
                  style: TextStyle(fontFamily: 'ConcertOne', fontSize: 15)),
            ),
          ),
          // widget row untuk text 'new user' dan 'register'
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "New User? ",
              ),
              TextButton(
                onPressed: () => Get.toNamed(Routes.SIGNUP),
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
