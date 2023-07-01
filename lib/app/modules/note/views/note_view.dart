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
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nama Buku"),
            SizedBox(height: 10),
            TextField(
              controller: controller.bookC,
              decoration: InputDecoration(
                  labelText: 'Nama Buku',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
            SizedBox(height: 10),
            Text("Halaman"),
            SizedBox(height: 10),
            TextField(
              controller: controller.pageC,
              decoration: InputDecoration(
                  labelText: 'Halaman buku',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () => controller.addNotes(
                    controller.bookC.text, controller.bookC.text),
                child: Text("Save"))
          ],
        ),
      )),
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
