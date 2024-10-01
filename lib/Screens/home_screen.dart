import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LeaseMate'),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.pushNamed(
                  context, '/profile'); // Navigate to User Profile
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dashboard Overview
            Text('Dashboard',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            _buildUpcomingPayments(),
            SizedBox(height: 20),
            _buildNotifications(),
            SizedBox(height: 20),

            // Quick Access Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildQuickAccessButton(
                    context, 'Search Properties', Icons.search, () {
                  Navigator.pushNamed(
                      context, '/search'); // Navigate to Property Listings
                }),
                _buildQuickAccessButton(
                    context, 'Submit Request', Icons.report_problem, () {
                  Navigator.pushNamed(
                      context, '/request'); // Navigate to Maintenance Request
                }),
                _buildQuickAccessButton(
                    context, 'View Documents', Icons.article, () {
                  Navigator.pushNamed(
                      context, '/documents'); // Navigate to Documents
                }),
              ],
            ),
            SizedBox(height: 20),

            // Featured Listings
            Text('Featured Listings',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            _buildFeaturedListings(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildUpcomingPayments() {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('Upcoming Payments: \$500 due on Oct 5',
            style: TextStyle(fontSize: 16)),
      ),
    );
  }

  Widget _buildNotifications() {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('Recent Notifications', style: TextStyle(fontSize: 16)),
      ),
    );
  }

  Widget _buildQuickAccessButton(BuildContext context, String label,
      IconData icon, VoidCallback onPressed) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, size: 40),
          onPressed: onPressed,
        ),
        Text(label),
      ],
    );
  }

  Widget _buildFeaturedListings() {
    // Sample featured listings
    return Container(
      height: 100, // Set a height for horizontal scroll
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildListingCard('Property 1', '1000', 'assets/property1.jpg'),
          _buildListingCard('Property 2', '1200', 'assets/property2.jpg'),
          _buildListingCard('Property 3', '800', 'assets/property3.jpg'),
        ],
      ),
    );
  }

  Widget _buildListingCard(String title, String price, String imageUrl) {
    return Card(
      child: Container(
        width: 150,
        child: Column(
          children: [
            Image.asset(imageUrl,
                fit: BoxFit.cover, height: 70, width: double.infinity),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            Text('\$$price/month', style: TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Listings'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Account'),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            // Home selected (already here)
            break;
          case 1:
            Navigator.pushNamed(
                context, '/listings'); // Navigate to Property Listings
            break;
          case 2:
            Navigator.pushNamed(
                context, '/account'); // Navigate to Account settings
            break;
        }
      },
    );
  }
}
