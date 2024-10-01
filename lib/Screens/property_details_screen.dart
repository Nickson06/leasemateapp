import 'package:flutter/material.dart';

class PropertyDetailsScreen extends StatelessWidget {
  final String title;
  final String price;
  final List<String> images;
  final String description;
  final List<String> amenities;

  PropertyDetailsScreen({
    required this.title,
    required this.price,
    required this.images,
    required this.description,
    required this.amenities,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Carousel
            _buildImageCarousel(),
            SizedBox(height: 16),

            // Property Information
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('\$$price/month',
                      style: TextStyle(color: Colors.green, fontSize: 20)),
                  SizedBox(height: 16),
                  Text('Description:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(description),
                  SizedBox(height: 16),
                  Text('Amenities:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Column(
                    children:
                        amenities.map((amenity) => Text('• $amenity')).toList(),
                  ),
                ],
              ),
            ),

            // Contact Owner and Schedule Visit Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Implement contact functionality
                    },
                    child: Text('Contact Owner'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Implement schedule visit functionality
                    },
                    child: Text('Schedule Visit'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCarousel() {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Image.asset(images[index], fit: BoxFit.cover);
        },
      ),
    );
  }
}
