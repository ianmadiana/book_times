import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteController extends GetxController {

  late TextEditingController bookC;
  late TextEditingController pageC;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addNotes(String bookName, String bookPage) async {
    CollectionReference notes = firestore.collection("notes");

    try {
      String dateNow = DateTime.now().toIso8601String();
      await notes.add({
        "name": bookName,
        "page": bookPage,
        "time": dateNow,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil Menambahkan produk",
        onConfirm: () {
          bookC.clear();
          pageC.clear();
          Get.back(); //close dialog
          Get.back(); //kembali ke home
        },
        textConfirm: "Ok",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil menambahkan catatan",
      );
    }
  }

  void updateNote (String bookName, String bookPage) async {
    // CollectionReference notes = firestore.collection("notes");

    // String dateNow = DateTime.now().toIso8601String();
  }

  @override
  void onInit() {
    bookC = TextEditingController();
    pageC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    bookC.dispose();
    pageC.dispose();
    super.onClose();
  }

  int selectedIndex = 1;


  void onItemTapped(int index) {
    if (index == 0) {
      Get.back();
    } else if (index == 1) {
      // Get.toNamed(Routes.NOTE);
    }

    selectedIndex = index;
    update();
  }


}
