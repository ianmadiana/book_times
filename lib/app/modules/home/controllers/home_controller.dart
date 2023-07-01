import 'dart:convert';

import 'package:book_times/app/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final List<Book> listBook = [];
  var apiKey = 'ZNaUkPnTc6FqAUswO3aRmcqPrTJAgseG';

  Future fetchData() async {
    var response = await http.get(Uri.parse(
        'https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=$apiKey'));

    List<dynamic> dataBooks =
        (jsonDecode(response.body) as Map<String, dynamic>)['results']['books'];

    for (var element in dataBooks) {
      listBook.add(Book.fromJson(element));
    }
  }

int selectedIndex = 0;

  static List widgetOptions = [
    Text('Home'),
    Text('Note'),
  ];

  void onItemTapped(int index) {
    if (index == 0) {
      Get.toNamed(Routes.HOME);
    } else if (index == 1) {
      Get.toNamed(Routes.NOTE);
    }

    selectedIndex = index;
    update();
  }
}
