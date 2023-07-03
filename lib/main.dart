import 'package:book_times/app/controllers/auth_controller.dart';
import 'package:book_times/app/modules/home/views/home_view.dart';
import 'package:book_times/app/modules/login/views/login_view.dart';
import 'package:book_times/app/utils/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: authC.streamAuthStatus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            print(snapshot.data);
            return GetMaterialApp(
              title: "Application",
              initialRoute: snapshot.data != null ? Routes.HOME : Routes.LOGIN,
              // home: snapshot.data != null ? HomeView() : LoginView(),
              debugShowCheckedModeBanner: false,
              getPages: AppPages.routes,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
                useMaterial3: true,
              ),
            );
          }
          return LoadingView();
        });
  }
}
