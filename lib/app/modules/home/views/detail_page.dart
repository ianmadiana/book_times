import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  Detail(
      {super.key,
      required this.imageDetail,
      required this.title,
      required this.publisher,
      required this.rank,
      required this.desc});

  String imageDetail;
  String title;
  String desc;
  String publisher;
  String rank;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.favorite_border_rounded))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 200,
                    width: 150,
                    child: Image.network(imageDetail),
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 200),
                        child: Text(
                          title,
                          // overflow: TextOverflow.ellipsis,
                          // maxLines: 2,
                          // softWrap: true,
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
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('Sample')),
                  ElevatedButton(
                      onPressed: () {}, child: Text('Buy on Amazon')),
                ],
              ),
              const SizedBox(height: 10),
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
