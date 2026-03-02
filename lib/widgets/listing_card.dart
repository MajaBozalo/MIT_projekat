import 'package:flutter/material.dart';
import '../models/listing.dart';

class ListingCard extends StatelessWidget {
  final Listing listing;

  const ListingCard({Key? key, required this.listing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final priceText = '€${listing.price.toStringAsFixed(0)} / mesečno';

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 160,
            child: Image.network(
              listing.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  const Center(child: Icon(Icons.broken_image)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(listing.title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Text(listing.location,
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                Text(priceText,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}