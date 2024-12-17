import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? _gender; // Gender selection
  DateTime? _birthDate; // Birthdate
  bool _isTermsAccepted = false; // Checkbox for terms and conditions

  // Function to select a date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _birthDate) {
      setState(() {
        _birthDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Account')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField("Email", false),
                _buildTextField("Password", true),
                _buildTextField("Confirm Password", true),
                _buildTextField("Enter Phone Number", false),
                SizedBox(height: 16),

                // Gender Selection
                Text("Gender:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Radio(
                      value: 'Male',
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value.toString();
                        });
                      },
                    ),
                    Text("Male"),
                    Radio(
                      value: 'Female',
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value.toString();
                        });
                      },
                    ),
                    Text("Female"),
                  ],
                ),

                // Birthdate Picker
                SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      "Birth Date:",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => _selectDate(context),
                      child: Text(_birthDate == null
                          ? "Select Date"
                          : "${_birthDate!.day}/${_birthDate!.month}/${_birthDate!.year}"),
                    ),
                  ],
                ),

                // Terms and Conditions
                SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                      value: _isTermsAccepted,
                      onChanged: (value) {
                        setState(() {
                          _isTermsAccepted = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        "I agree to the terms and conditions.",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                // Register Button
                Center(
                  child: ElevatedButton(
                    onPressed: _isTermsAccepted
                        ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Registration Successful!"),
                        ),
                      );
                      Navigator.pop(context);
                    }
                        : null,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text("Register"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, bool isPassword) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: hint,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
