import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  final String propertyName;
  final double rentalAmount;
  final String propertyImage;
  final String recipientName; // New field for recipient's name

  PaymentScreen({
    required this.propertyName,
    required this.rentalAmount,
    required this.propertyImage,
    required this.recipientName, // Initialize recipient's name
  });

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  bool _isPaymentProcessed = false;
  bool _isLoading = false; // To manage loading state
  String? _selectedPaymentMethod;

  void _processPayment() {
    // Implement payment processing functionality here
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    // Simulate a network call or payment processing
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isPaymentProcessed = true;
        _isLoading = false; // Hide loading indicator
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.propertyName,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Rental Amount: \$${widget.rentalAmount}'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Money Recipient Details
            Text('Payment Recipient:'),
            Text(widget.recipientName,
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 20),

            // Payment Method Selection
            Text('Select Payment Method:'),
            ListTile(
              title: Text('Credit Card'),
              leading: Radio(
                value: 'Credit Card',
                groupValue: _selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethod = value.toString();
                  });
                },
              ),
            ),
            ListTile(
              title: Text('PayPal'),
              leading: Radio(
                value: 'PayPal',
                groupValue: _selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethod = value.toString();
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Mobile Money'),
              leading: Radio(
                value: 'Mobile Money',
                groupValue: _selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethod = value.toString();
                  });
                },
              ),
            ),
            SizedBox(height: 20),

            // Payment Information Form
            Text('Payment Information:'),
            TextField(
              controller: _cardNumberController,
              decoration: InputDecoration(hintText: 'Card Number'),
            ),
            TextField(
              controller: _expiryDateController,
              decoration: InputDecoration(hintText: 'Expiry Date (MM/YY)'),
            ),
            TextField(
              controller: _cvvController,
              decoration: InputDecoration(hintText: 'CVV'),
              obscureText: true,
            ),
            SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed:
                  _isLoading ? null : _processPayment, // Disable if loading
              child: _isLoading
                  ? CircularProgressIndicator(
                      color: Colors.white) // Show loading indicator
                  : Text('Confirm Payment'),
            ),

            // Confirmation Message
            if (_isPaymentProcessed)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Payment has been processed successfully!',
                  style: TextStyle(color: Colors.green),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
