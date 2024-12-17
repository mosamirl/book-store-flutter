import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  final List<Map<String, String>> teamMembers = [
    {'name': 'Mohamed Samir', 'role': 'sign in , about us'},
    {'name': 'Mohamed Salama', 'role': 'home'},
    {'name': 'Roaa kamal', 'role': 'book details,cart screen'},
    {'name': 'Rana Saad', 'role': 'sign up'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Meet Our Team',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
            ),
            SizedBox(height: 20),
            Table(
              border: TableBorder.all(color: Colors.grey, width: 1),
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(3),
              },
              children: [
                // Table Header
                TableRow(
                  decoration: BoxDecoration(color: Colors.teal.withOpacity(0.1)),
                  children: [
                    _buildTableCell('Name', isHeader: true),
                    _buildTableCell('Role', isHeader: true),
                  ],
                ),
                // Table Content
                ...teamMembers.map(
                      (member) => TableRow(
                    children: [
                      _buildTableCell(member['name']!),
                      _buildTableCell(member['role']!),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper to build table cells
  Widget _buildTableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: isHeader ? 16 : 14,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          color: isHeader ? Colors.teal : Colors.blueAccent,
        ),
      ),
    );
  }
}
