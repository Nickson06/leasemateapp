import 'package:flutter/material.dart';

class ContactOwnerScreen extends StatefulWidget {
  final String propertyName;
  final String propertyImage;

  ContactOwnerScreen({
    required this.propertyName,
    required this.propertyImage,
  });

  @override
  _ContactOwnerScreenState createState() => _ContactOwnerScreenState();
}

class _ContactOwnerScreenState extends State<ContactOwnerScreen> {
  final TextEditingController _messageController = TextEditingController();
  bool _isMessageSent = false;

  void _sendMessage() {
    // Implement send message functionality here
    setState(() {
      _isMessageSent = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Owner'),
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
            // Property Details
            Row(
              children: [
                Image.asset(widget.propertyImage,
                    width: 100, height: 100, fit: BoxFit.cover),
                SizedBox(width: 16),
                Expanded(
                    child: Text(widget.propertyName,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
              ],
            ),
            SizedBox(height: 20),

            // Message Input Field
            TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Write your message here...',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ),
              maxLines: 5,
            ),

            SizedBox(height: 20),

            // Confirmation Message
            if (_isMessageSent)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Your message has been sent!',
                  style: TextStyle(color: Colors.green),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
