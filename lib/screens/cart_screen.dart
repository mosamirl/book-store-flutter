import 'package:flutter/material.dart';
import '../models/book.dart';
import '../models/cart.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: cartItems.isEmpty
          ? Center(child: Text("Your cart is empty!"))
          : ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (ctx, index) {
          Book book = cartItems[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: ListTile(
              leading: Image.asset(book.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
              title: Text(book.title),
              subtitle: Text("By ${book.author}\n\$${book.price}"),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  // Remove book from cart
                  cartItems.removeAt(index);
                  (context as Element).markNeedsBuild();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
