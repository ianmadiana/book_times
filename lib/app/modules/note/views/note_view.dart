import 'package:book_times/app/modules/note/controllers/note_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class NoteView extends GetView<NoteController> {
  NoteView({Key? key}) : super(key: key);

  final CollectionReference _notes =
      FirebaseFirestore.instance.collection('notes');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Notes', style: TextStyle(fontFamily: 'chomsky')),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: _notes.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    snapshot.data!.docs[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(documentSnapshot['name']),
                                const Divider(
                                  color: Colors.grey,
                                ),
                                Text(documentSnapshot['page'])
                              ],
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                              highlightColor: Colors.lightBlue,
                              onPressed: () {
                                _createOrUpdate(documentSnapshot);
                              },
                              icon: const Icon(Icons.edit)),
                          // const Text('edit')
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Column(
                          children: [
                            IconButton(
                                highlightColor: Colors.red,
                                onPressed: () {
                                  _deleteNote(documentSnapshot.id);
                                },
                                icon: const Icon(Icons.delete)),
                            // const Text('delete')
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
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
                                controller.bookC.text, controller.pageC.text),
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

  // Delete
  Future<void> _deleteNote(String noteId) async {
    await _notes.doc(noteId).delete();

    // Show a snackbar
    Get.snackbar('Deleted', 'Note deleted',
        snackPosition: SnackPosition.BOTTOM);
  }

  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
    // String action = 'create';
    if (documentSnapshot != null) {
      // action = 'update';
      controller.bookC.text = documentSnapshot['name'];
      controller.pageC.text = documentSnapshot['page'].toString();
    }

    await Get.bottomSheet(BottomSheet(
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
                        controller.bookC.text, controller.pageC.text),
                    child: const Text("Save"))
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
