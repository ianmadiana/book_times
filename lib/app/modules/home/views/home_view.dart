import 'package:book_times/app/modules/home/views/detail_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../widgets/book_item.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,s
      appBar: AppBar(
        title: const Text(
          'Book Times',
          style: TextStyle(fontFamily: 'chomsky'),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
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
                                  )));
                    },
                    child: BookItem(data: data),
                  );
                },
              );
            }
          }),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: ListItemBackground.mainColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Resep',
          ),
        ],
        currentIndex: controller.selectedIndex,
        onTap: controller.onItemTapped,
        selectedItemColor:
            Colors.blue, // Mengatur warna ikon dan teks terpilih (selected)
        unselectedItemColor: Colors
            .white, // Mengatur warna ikon dan teks tidak terpilih (unselected)
      ),
    );
  }
}

// _bottomNavBarItem({
//   required String assetPath,
//   required String label,
// }) {
//   return BottomNavigationBarItem(
//       icon: Image.asset(
//         assetPath,
//         width: 24,
//         height: 24,
//         // color: Colors.lightBlue,
//       ),
//       label: label);
// }
