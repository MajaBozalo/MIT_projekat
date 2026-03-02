// ...existing code...
import 'package:flutter/material.dart';

class Listing {
  final String id;
  final String title;
  final String location;
  final String description;
  final double price;
  final String imageUrl;

  const Listing({
    required this.id,
    required this.title,
    required this.location,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

/// Simple reusable card used in the list (UI only)
class ListingCard extends StatelessWidget {
  final Listing listing;

  const ListingCard({Key? key, required this.listing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final priceText = '€${listing.price.toStringAsFixed(0)} / mesečno';
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 4,
      shadowColor: Colors.black26,
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Cover image
          SizedBox(
            height: 160,
            child: Image.network(
              listing.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (_, __, ___) => Container(
                color: Colors.grey.shade200,
                child: const Center(child: Icon(Icons.broken_image, size: 48)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              children: [
                // Text info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(listing.title,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.location_on, size: 14, color: Colors.grey),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(listing.location,
                                style: const TextStyle(fontSize: 13, color: Colors.grey)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                // Price + details button (UI only)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(priceText,
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: null, // UI-only: no navigation
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade50,
                        foregroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        elevation: 0,
                      ),
                      child: const Text('Detalji'),
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

/// RegistrovaniScreen - UI only, no backend, no navigation
class RegistrovaniScreen extends StatelessWidget {
  const RegistrovaniScreen({Key? key}) : super(key: key);

  static const List<Listing> sampleListings = [
    Listing(
      id: '1',
      title: 'Dvosoban stan',
      location: 'Novi Sad',
      description: '65m² · terasa · parking',
      price: 450,
      imageUrl: 'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=1200',
    ),
    Listing(
      id: '2',
      title: 'Garsonjera',
      location: 'Beograd',
      description: '28m² · centar · novogradnja',
      price: 300,
      imageUrl: 'https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=1200',
    ),
    Listing(
      id: '3',
      title: 'Trosoban stan',
      location: 'Niš',
      description: '90m² · terasa · lift',
      price: 520,
      imageUrl: 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=1200',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moji stanovi'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            tooltip: 'Profil',
            onPressed: () {}, // UI-only
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Odjavi se',
            onPressed: () {}, // UI-only
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: sampleListings.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final listing = sampleListings[index];
          return ListingCard(listing: listing);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // UI-only
        tooltip: 'Dodaj stan',
        child: const Icon(Icons.add),
      ),
    );
  }
}