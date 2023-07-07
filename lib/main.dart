import 'package:book_times/app/controllers/auth_controller.dart';
import 'package:book_times/app/utils/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  // fitur binding pada flutter
  WidgetsFlutterBinding.ensureInitialized();
  // inisialisasi firebase saat pertama kali aplikasi dijalankan
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // variabel untuk autentikasi
  final authC = Get.put(AuthController(), permanent: true);
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // stream builder untuk memeriksa apakah aplikasi dalam keadaan
    // sudah login atau belum dengan memeriksa state dari user
    return StreamBuilder<User?>(
        stream: authC.streamAuthStatus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            print(snapshot.data);
            return GetMaterialApp(
              title: "Application",
              // routing jika user sudah login atau belum
              initialRoute:
                  snapshot.data != null && snapshot.data!.emailVerified == true
                      ? Routes.HOME
                      : Routes.LOGIN,
              // home: snapshot.data != null ? HomeView() : LoginView(),
              debugShowCheckedModeBanner: false,
              getPages: AppPages.routes,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
                useMaterial3: true,
              ),
            );
          }
          return const LoadingView();
        });
  }
}
