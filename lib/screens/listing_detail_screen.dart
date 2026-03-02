import 'package:flutter/material.dart';
import '../models/listing.dart';

class ListingDetailScreen extends StatelessWidget {
  final Listing listing;

  const ListingDetailScreen({
    super.key,
    required this.listing,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(listing.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              listing.imageUrl,
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              listing.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              listing.location,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),
            Text(
              "€${listing.price.toStringAsFixed(0)} mesečno",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(listing.description),
            ),
          ],
        ),
      ),
    );
  }
}