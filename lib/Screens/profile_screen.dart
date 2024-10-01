import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final String userName;
  final String email;
  final String phoneNumber;
  final String profileImage;

  ProfileScreen({
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.profileImage,
  });

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.userName;
    _emailController.text = widget.email;
    _phoneController.text = widget.phoneNumber;
  }

  void _saveChanges() {
    // Implement save functionality here
    // Update user information in the backend if necessary
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Your profile has been updated!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _logout() {
    // Implement logout functionality here
    // This could involve clearing user session or token
    Navigator.pop(
        context); // Navigate back to the previous screen or login screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
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
            // Profile Picture
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(widget.profileImage),
            ),
            SizedBox(height: 20),

            // Editable User Information
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),

            // Save Changes Button
            ElevatedButton(
              onPressed: _saveChanges,
              child: Text('Save Changes'),
            ),
            SizedBox(height: 20),

            // Logout Button
            ElevatedButton(
              onPressed: _logout,
              child: Text('Logout'),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
