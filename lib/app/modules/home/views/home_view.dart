import 'package:book_times/app/controllers/auth_controller.dart';
import 'package:book_times/app/modules/home/views/detail_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../widgets/book_item.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Book Times',
          style: TextStyle(fontFamily: 'chomsky'),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => authC.logout(),
            icon: Image.asset(
              'assets/icons/logout.png',
              height: 20,
              width: 20,
            ),
            color: Colors.black,
          )
        ],
      ),
      body: FutureBuilder(
          future: controller.fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 2.4,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2),
                padding: const EdgeInsets.all(5),
                itemCount: controller.listBook.length,
                itemBuilder: (context, index) {
                  var data = controller.listBook[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Detail(
                                    imageDetail: data.bookImage,
                                    desc: data.description,
                                    title: data.title,
                                    publisher: data.publisher,
                                    rank: data.rank.toString(),
                                  )));
                    },
                    child: BookItem(data: data),
                  );
                },
              );
            }
          }),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Notes',
          ),
        ],
        currentIndex: controller.selectedIndex,
        onTap: controller.onItemTapped,
        selectedItemColor:
            Colors.grey, // Mengatur warna ikon dan teks terpilih (selected)
        unselectedItemColor: Colors
            .black, // Mengatur warna ikon dan teks tidak terpilih (unselected)
      ),
    );
  }
}