import 'package:flutter/material.dart';

class PropertyListingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Property Listings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            _buildSearchBar(),
            SizedBox(height: 20),

            // Property List
            Expanded(child: _buildPropertyList()),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search by location or price...',
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.search),
      ),
      onSubmitted: (value) {
        // Implement search functionality
      },
    );
  }

  Widget _buildPropertyList() {
    // Sample property cards
    return ListView(
      children: [
        _buildPropertyCard(
            'Beautiful Apartment', '1200', 'assets/property1.jpg'),
        _buildPropertyCard('Luxury Condo', '1500', 'assets/property2.jpg'),
        _buildPropertyCard('Cozy Studio', '800', 'assets/property3.jpg'),
        // Add more property cards as needed
      ],
    );
  }

  Widget _buildPropertyCard(String title, String price, String imageUrl) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Image.asset(imageUrl, fit: BoxFit.cover, width: 100),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('\$$price/month', style: TextStyle(color: Colors.green)),
        onTap: () {
          // Navigate to Property Details screen
        },
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
