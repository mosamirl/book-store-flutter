import 'package:flutter/material.dart';
import '../models/book.dart';
import '../screens/book_details.dart';

class BookItem extends StatelessWidget {
  final Book book;

  BookItem({required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: ListTile(
        leading: Image.asset(
          book.imageUrl,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        title: Text(book.title),
        subtitle: Text("By ${book.author}\n\$${book.price}"),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => BookDetails(book: book)),
          );
        },
      ),
    );
  }
}
