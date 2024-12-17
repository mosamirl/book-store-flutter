import 'package:flutter/material.dart';
import 'sign_up.dart';
import 'home_screen.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('images/logo.webp', height: 200),
              SizedBox(height: 20),
              _buildTextField("Email", false),
              _buildTextField("Password", true),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => HomeScreen()),
                ),
                child: Text("Login"),
              ),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SignUpScreen()),
                ),
                child: Text("Don't have an account? Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, bool isPassword) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: hint,
          border: OutlineInputBorder(),
          prefixIcon: Icon(isPassword ? Icons.lock : Icons.email),
        ),
      ),
    );
  }
}
