import 'package:flutter/material.dart';
import 'screens/sign_in.dart';
import 'screens/sign_up.dart';
import 'screens/home_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/about_screen.dart';

void main() => runApp(BookstoreApp());

class BookstoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bookstore App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[200],
        fontFamily: 'Roboto',
      ),
      // Define routes
      initialRoute: '/',
      routes: {
        '/': (context) => SignInScreen(),       // Default route
        '/signup': (context) => SignUpScreen(), // Sign Up
        '/home': (context) => HomeScreen(),     // Home
        '/cart': (context) => CartScreen(),     // Cart
        '/about': (context) => AboutScreen(),   // About Us
      },
    );
  }
}
