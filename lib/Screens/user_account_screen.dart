import 'package:flutter/material.dart';

class UserAccountScreen extends StatelessWidget {
  final String userName;
  final String email;

  UserAccountScreen({
    required this.userName,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Information
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets/profile.jpg'), // Placeholder for profile image
              ),
            ),
            SizedBox(height: 16),
            Text(userName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(email, style: TextStyle(color: Colors.grey)),

            SizedBox(height: 30),

            // Account Options
            _buildAccountOption(context, 'Edit Profile', () {
              // Implement edit profile functionality
            }),
            _buildAccountOption(context, 'Rental History', () {
              // Navigate to Rental History screen
            }),
            _buildAccountOption(context, 'Change Password', () {
              // Implement change password functionality
            }),
            _buildAccountOption(context, 'Logout', () {
              // Implement logout functionality
            }),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildAccountOption(
      BuildContext context, String title, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50), // Make button full width
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Listings'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Account'),
      ],
      onTap: (index) {
        // Handle navigation
      },
    );
  }
}
