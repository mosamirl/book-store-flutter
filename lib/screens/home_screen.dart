import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/book_item.dart';

import '../widgets/custome_drawer.dart';
import 'cart_screen.dart'; // Import the Cart Screen

class HomeScreen extends StatelessWidget {
  final List<Book> books = [
    Book(
      title: '1984',
      author: 'George Orwell',
      price: 10.0,
      imageUrl: 'images/images1984.webp',
    ),
    Book(
      title: 'The Alchemist',
      author: 'Paulo Coelho',
      price: 12.0,
      imageUrl: 'images/imagesalchemist.webp',
    ),
    Book(
      title: 'Flutter Guide',
      author: 'John Smith',
      price: 15.0,
      imageUrl: 'images/imagesflutter_guide.webp',
    ),
    Book(
      title: '1998',
      author: 'George Orwell',
      price: 10.0,
      imageUrl: 'images/images1984.webp',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookstore'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to Cart Screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartScreen()),
              );
            },
          ),
        ],
      ),
      drawer: CustomDrawer(), // Custom Drawer
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: books.length,
          itemBuilder: (ctx, index) => BookItem(book: books[index]),
        ),
      ),
    );
  }
}
