import 'package:flutter/material.dart';

class ListingCard extends StatelessWidget {
  final String title;
  final String location;
  final double price;

  const ListingCard({
    super.key,
    required this.title,
    required this.location,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text("Lokacija: $location"),
            const SizedBox(height: 8),
            Text(
              "Cena: €$price",
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}