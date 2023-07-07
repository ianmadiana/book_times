import 'package:flutter/material.dart';

// class detail dari buku yang di-klik user
class Detail extends StatelessWidget {
  const Detail(
      {super.key,
      required this.imageDetail,
      required this.title,
      required this.publisher,
      required this.rank,
      required this.desc});

  final String imageDetail;
  final String title;
  final String desc;
  final String publisher;
  final String rank;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // widget untuk menampilkan icon favorit
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.favorite_border_rounded))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          // widget untuk menampilkan elemen secara listview
          child: ListView(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // widget untuk menampilkan poster buku
                  SizedBox(
                    height: 200,
                    width: 150,
                    child: Image.network(imageDetail),
                  ),
                  // widget untuk menampilkan publisher
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 200),
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(publisher),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            // widget untuk menampilkan posisi rank mingguan
                            Text(
                              rank,
                              style: const TextStyle(fontSize: 12),
                            ),
                            const SizedBox(width: 5),
                            const Icon(
                              Icons.star,
                              size: 18,
                            ),
                          ],
                        ),
                        const Text('Rank')
                      ],
                    ),
                    const VerticalDivider(
                      thickness: 2,
                      color: Colors.grey,
                    ),
                    const Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 5),
                            Icon(
                              Icons.book,
                              size: 18,
                            ),
                          ],
                        ),
                        Text('Ebook'),
                      ],
                    ),
                    const VerticalDivider(
                      thickness: 2,
                      color: Colors.grey,
                    ),
                    const Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 5),
                            Icon(
                              Icons.shopping_bag_rounded,
                              size: 18,
                            ),
                          ],
                        ),
                        Text('Shop'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text('Sample')),
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Buy on Amazon')),
                ],
              ),
              const SizedBox(height: 10),
              // widget untuk menampilkan deskripsi dari buku
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'About this book',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Text(desc)
                  ],
                ),
              )
            ],
          )),
    );
  }
}
