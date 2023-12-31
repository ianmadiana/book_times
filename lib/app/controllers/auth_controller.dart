import 'package:book_times/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

// class controller untuk mengatur fungsi autentikasi
class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  // Rfungsi untuk RESET PASSWORD
  void resetPassword(String email) async {
    if (email != "" && GetUtils.isEmail(email)) {
      try {
        await auth.sendPasswordResetEmail(email: email);
        Get.defaultDialog(
            title: 'Hooray ✨',
            middleText: 'Email verification has ben sent to $email',
            onConfirm: () {
              Get.back(); //close dialog
              Get.back(); //go to login
            },
            textConfirm: 'Ok');
      } catch (e) {
        Get.defaultDialog(title: 'Oops ⛔', middleText: 'Cannot reset password');
      }
    } else {
      Get.defaultDialog(title: 'Oops ⛔', middleText: 'Email is not valid');
    }
  }

// fungsi untuk SINGUP
  void signup(String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await userCredential.user!.sendEmailVerification();
      Get.defaultDialog(
          title: 'Email Verification',
          middleText: 'Check your email $email for verification',
          onConfirm: () {
            Get.back();
            Get.back(); //go to login
          },
          textConfirm: 'Ok');
    } on FirebaseAuthException catch (e) {
      if (e.code == ' weak-password') {
        print('The password provided is too weak.');
        Get.defaultDialog(
            title: 'Weak password',
            middleText: 'Password is too weak',
            textCancel: 'Ok');
      } else if (e.code == 'email-already-in-use') print('The email exists');
      Get.defaultDialog(
        title: 'Oops',
        middleText: 'The email already exists',
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: 'Sorry...',
        middleText: 'You can\'t register right now',
      );
    }
  }

// fungsi untuk LOGIN
  void login(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
            title: 'Email Verification',
            middleText: 'Email not verified. Do you want send verification?',
            onConfirm: () async {
              await userCredential.user!.sendEmailVerification();
              Get.back();
            },
            textConfirm: 'Send again',
            textCancel: 'Back');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.defaultDialog(
            title: 'Sorry...', middleText: 'User not found', textCancel: 'Ok');
      } else if (e.code == 'wrong-password') {
        print('Password is wrong.');
        Get.defaultDialog(
          title: 'Sorry...',
          middleText: 'The password is wrong',
        );
      }
    } catch (e) {
      Get.defaultDialog(
          title: 'Sorry...',
          middleText: 'You can\'t register right now',
          textCancel: 'Ok');
    }
  }

// fungsi untuk LOGOUT
  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
