import 'package:book_store/screens/sign_in.dart';
import 'package:flutter/material.dart';
import '../screens/about_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(10),
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("User Name"),
            accountEmail: Text("user@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 60, color: Colors.teal),
            ),
            decoration: BoxDecoration(color: Colors.teal),
          ),
          ListTile(
            leading: Icon(Icons.home_filled, color: Colors.teal),
            title: Text("Home"),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(Icons.info, color: Colors.teal),
            title: Text("About Us"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AboutScreen()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text("Logout"),
            onTap: () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>SignInScreen())),
          ),
        ],
      ),
    );
  }
}
