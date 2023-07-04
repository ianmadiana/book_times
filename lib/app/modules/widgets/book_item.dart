import 'package:book_times/app/models/book_model.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    super.key,
    required this.data,
  });

  final Book data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(elevation: 10, child: Image.network(data.bookImage)),
        Padding(
          padding: const EdgeInsets.all(7.0),
          child: Text(
            data.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.all(3),
          child: Text(
            data.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 203, 241, 245),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      '👑 ${data.rank}',
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 252, 227, 138),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      '✍ ${data.author}',
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
