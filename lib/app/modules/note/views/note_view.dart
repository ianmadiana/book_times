import 'package:book_times/app/modules/note/controllers/note_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class NoteView extends GetView<NoteController> {
  const NoteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Catatan'),
        centerTitle: true,
      ),
      body: const Center(child: Text('data')),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: ListItemBackground.mainColor,
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
            Colors.black, // Mengatur warna ikon dan teks terpilih (selected)
        unselectedItemColor: Colors
            .grey, // Mengatur warna ikon dan teks tidak terpilih (unselected)
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.bottomSheet(BottomSheet(
              onClosing: () {},
              builder: (context) => ListView(
                children: [
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Nama Buku"),
                        const SizedBox(height: 10),
                        TextField(
                          controller: controller.bookC,
                          decoration: const InputDecoration(
                              labelText: 'Nama Buku',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        ),
                        const SizedBox(height: 10),
                        const Text("Halaman"),
                        const SizedBox(height: 10),
                        TextField(
                          controller: controller.pageC,
                          decoration: const InputDecoration(
                              labelText: 'Halaman buku',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                            onPressed: () => controller.addNotes(
                                controller.bookC.text, controller.bookC.text),
                            child: const Text("Save"))
                      ],
                    ),
                  ))
                ],
              ),
            ));
          },
          child: const Icon(Icons.add)),
    );
  }
}
