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

class GuestHomeScreen extends StatelessWidget {
  const GuestHomeScreen({super.key});

  static const List<Listing> sampleListings = [
    Listing(
      id: '1',
      title: 'Dvosoban stan',
      location: 'Novi Sad',
      description: '65m² · terasa · parking',
      price: 450.0,
      imageUrl: 'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=1200',
    ),
    Listing(
      id: '2',
      title: 'Garsonjera',
      location: 'Beograd',
      description: '28m² · centar · novogradnja',
      price: 300.0,
      imageUrl: 'https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=1200',
    ),
    Listing(
      id: '3',
      title: 'Trosoban stan',
      location: 'Niš',
      description: '90m² · terasa · lift',
      price: 520.0,
      imageUrl: 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=1200',
    ),
  ];

  void _openDetails(BuildContext context, Listing listing) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ListingDetailScreen(listing: listing),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stanovi'),
        actions: [
          IconButton(
            icon: const Icon(Icons.login),
            onPressed: () {
              // TODO: Navigacija na login screen
            },
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: sampleListings.length,
        itemBuilder: (context, index) {
          final listing = sampleListings[index];
          return GestureDetector(
            onTap: () => _openDetails(context, listing),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 6,
              margin: const EdgeInsets.only(bottom: 16),
              shadowColor: Colors.black26,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Image (full width, rounded corners at top)
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Hero(
                      tag: 'listing-image-${listing.id}',
                      child: Image.network(
                        listing.imageUrl,
                        height: (width * 0.5).clamp(140.0, 260.0),
                        width: double.infinity,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return SizedBox(
                            height: (width * 0.5).clamp(140.0, 260.0),
                            child: const Center(child: CircularProgressIndicator()),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) => SizedBox(
                          height: (width * 0.5).clamp(140.0, 260.0),
                          child: const Center(child: Icon(Icons.broken_image, size: 48, color: Colors.grey)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listing.title,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.location_on, size: 14, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Text(
                                    listing.location,
                                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                listing.description,
                                style: const TextStyle(fontSize: 13, color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                        // Price
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '€${listing.price.toStringAsFixed(0)}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(height: 6),
                            SizedBox(
                              height: 36,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  backgroundColor: Colors.blue.shade50,
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                ),
                                onPressed: () => _openDetails(context, listing),
                                child: const Text(
                                  'Pogledaj detalje',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ListingDetailScreen extends StatelessWidget {
  final Listing listing;
  const ListingDetailScreen({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(listing.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: 'listing-image-${listing.id}',
              child: Image.network(
                listing.imageUrl,
                height: MediaQuery.of(context).size.width * 0.7,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listing.title,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.grey),
                      const SizedBox(width: 6),
                      Text(
                        listing.location,
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    listing.description,
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '€${listing.price.toStringAsFixed(0)} / mesečno',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Otvori rezervaciju / kontakt
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text('Kontaktiraj stanodavca'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}