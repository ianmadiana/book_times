import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
   Detail(
      {super.key,
      required this.imageDetail,
      required this.title,
      required this.desc});

  String imageDetail;
  String title;
  String desc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Column(
        children: [Image.network(imageDetail),
        Text(title),
        Text(desc)
        ],
      ),
    );
  }
}
