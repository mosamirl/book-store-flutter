import 'package:flutter/material.dart';
import '../models/book.dart';
import '../models/cart.dart';


class BookDetails extends StatelessWidget {
  final Book book;

  BookDetails({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                book.imageUrl,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              book.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
            ),
            Text(
              "By ${book.author}",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              "\$${book.price}",
              style: TextStyle(fontSize: 20, color: Colors.teal, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(

              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white

              ),
              onPressed: () {
                // Add book to cart
                cartItems.add(book);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${book.title} added to cart!',)),
                );
              },
              child: Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
