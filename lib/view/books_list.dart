import 'package:flutter/material.dart';
import 'package:task_bilclick/model/books_model.dart';
import 'package:task_bilclick/view/book_detail.dart';

class BooksList extends StatelessWidget {
  const BooksList({Key? key, required this.length, required this.books})
      : super(key: key);

  final int length;
  final List<BooksModel> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetail(
                    author: books[index].author,
                    group: books[index].group,
                    name: books[index].name,
                  ),
                ),
              );
            },
            trailing: Text(books[index].name.toString()),
            leading: Image.asset("assets/images/books.jpg"),
            title: Text(
              books[index].author.toString(),
              style: const TextStyle(fontSize: 30),
            ),
            subtitle: Text(
              books[index].group.toString(),
              style: const TextStyle(fontSize: 30),
            ),
          ),
        );
      },
    );
  }
}
