import 'package:flutter/material.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({Key? key, this.author, this.group, this.name})
      : super(key: key);

  final String? author;
  final String? group;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/images/books.jpg"),
            Text(
              group!,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              author!,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
