import 'package:flutter/material.dart';
import 'package:mit_projekat/models/listing.dart';

class ListingCard extends StatelessWidget {
  final Listing listing;
  final VoidCallback? onDetails;

  const ListingCard({
    super.key,
    required this.listing,
    this.onDetails,
  });

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(listing.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(listing.location,
                          style: const TextStyle(color: Colors.grey)),
                      const SizedBox(height: 6),
                      Text(listing.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "€${listing.price.toStringAsFixed(0)}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    const SizedBox(height: 6),
                    ElevatedButton(
                      onPressed: onDetails,
                      child: const Text("Detalji"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}