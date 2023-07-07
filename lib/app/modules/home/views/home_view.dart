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
          // Tombol untuk logout dengan memanggil fungsi logout() dari controller
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
      // fetch data API menggunakan future builder
      body: FutureBuilder(
          future: controller.fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                // menampilkan loading bar jika masih proses mengambil data
                child: CircularProgressIndicator(),
              );
            } else {
              // tampilkan data dari API jika data sudah dimuat semua
              // menampilkan data menggunakan gridview dibagi menjadi 2 item
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
                  // item dibungkus dengan widget inkwell agar bisa di-klik
                  return InkWell(
                    onTap: () {
                      // pada saat item diklik akan menuju ke detail page
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            // detail page mengambil beberapa parameter menggunakan constructor
                              builder: (context) => Detail(
                                    imageDetail: data.bookImage,
                                    desc: data.description,
                                    title: data.title,
                                    publisher: data.publisher,
                                    rank: data.rank.toString(),
                                  )));
                    },
                    // widget untuk menampilkan item dari API
                    child: BookItem(data: data),
                  );
                },
              );
            }
          }),
          // bottom navigasi
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
            Colors.grey,
        unselectedItemColor: Colors
            .black, 
      ),
    );
  }
}