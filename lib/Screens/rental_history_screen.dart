import 'package:flutter/material.dart';

class RentalHistoryScreen extends StatelessWidget {
  final List<RentalTransaction> transactions;

  RentalHistoryScreen({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rental History'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: transactions.isEmpty
            ? Center(child: Text('You have no rental history.'))
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return _buildRentalCard(transactions[index]);
                },
              ),
      ),
    );
  }

  Widget _buildRentalCard(RentalTransaction transaction) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(transaction.propertyName,
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle:
            Text('From: ${transaction.startDate} To: ${transaction.endDate}'),
        trailing: Text('\$${transaction.monthlyRent}/month',
            style: TextStyle(color: Colors.green)),
        onTap: () {
          // Navigate to Rental Details screen if needed
        },
      ),
    );
  }
}

// Sample RentalTransaction class to hold rental data
class RentalTransaction {
  final String propertyName;
  final String startDate;
  final String endDate;
  final double monthlyRent;

  RentalTransaction({
    required this.propertyName,
    required this.startDate,
    required this.endDate,
    required this.monthlyRent,
  });
}
