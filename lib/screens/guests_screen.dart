import 'package:flutter/material.dart';
import 'package:mit_projekat/models/listing.dart';
import 'package:mit_projekat/widgets/listing_card.dart';

class GuestHomeScreen extends StatelessWidget {
  const GuestHomeScreen({super.key});

  static const List<Listing> sampleListings = [
    Listing(
      id: '1',
      title: 'Dvosoban stan',
      location: 'Novi Sad',
      description: '65m² · terasa · parking',
      price: 450,
      imageUrl: 'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=1200',
      ownerEmail: 'admin@gmail.com',
    ),
    Listing(
      id: '2',
      title: 'Garsonjera',
      location: 'Beograd',
      description: '28m² · centar · novogradnja',
      price: 300,
      imageUrl: 'https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=1200',
      ownerEmail: 'admin@gmail.com',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stanovi")),
      body: ListView.builder(
        itemCount: sampleListings.length,
        itemBuilder: (context, index) {
          return ListingCard(listing: sampleListings[index]);
        },
      ),
    );
  }
}