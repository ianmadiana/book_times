import 'package:book_times/app/controllers/auth_controller.dart';
import 'package:book_times/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  // bool _obscureText = true;

  final authC = Get.find<AuthController>();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Center(
                  // widget gambar
                  child: SizedBox(
                    height: 100,
                    child: Image.asset('assets/icons/tree.png'),
                  ),
                ),
              ),
              // widget container untuk membungkus text "Login"
              Container(
                padding: const EdgeInsets.all(20),
                child: const Center(
                  child: Text(
                    "Login",
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
              Padding(
                padding: const EdgeInsets.all(20),
                // widget textfield untuk memasukkan input password
                child: TextField(
                  // controller input form email dan password
                  controller: controller.passC,
                  // obscureText: _obscureText,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsetsDirectional.symmetric(horizontal: 10),
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                    // suffixIcon: IconButton(
                    // icon: Icon(_obscureText
                    //     ? Icons.visibility
                    //     : Icons.visibility_off),
                    // onPressed: () => null,
                    // onPressed: _toggleObscureText,
                    // ),
                  ),
                ),
              ),
              // widget text untuk 'forgot password'
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      // routing ke halaman reset password
                      onPressed: () {
                        Get.toNamed(Routes.RESET_PASSWORD);
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              // memanggil fungsi login dari controller dengan memasukkan paramater email dan password
              onPressed: () =>
                  authC.login(controller.emailC.text, controller.passC.text),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsetsDirectional.symmetric(
                  vertical: 20,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text("Login",
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
                // routing ke halaman signup
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
