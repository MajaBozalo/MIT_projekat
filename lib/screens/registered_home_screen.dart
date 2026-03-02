import 'package:flutter/material.dart';
import '../app_scope.dart';
import '../models/listing.dart';
import 'listing_form_screen.dart';
import 'guests_screen.dart'; 
import 'listing_detail_screen.dart';

class RegisteredHomeScreen extends StatelessWidget {
  const RegisteredHomeScreen({super.key});

  void _openDetails(BuildContext context, Listing listing) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => ListingDetailScreen(listing: listing)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final app = AppScope.of(context);
    final listings = app.listings;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrovani korisnik'),
        actions: [
          IconButton(
            tooltip: 'Odjava',
            icon: const Icon(Icons.logout),
            onPressed: () {
              app.logout();
              Navigator.of(context).pop(); // vrati na HomeScreen
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const ListingFormScreen()),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Dodaj stan'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: listings.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final l = listings[index];
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => _openDetails(context, l),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        l.imageUrl,
                        width: 96,
                        height: 72,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          width: 96,
                          height: 72,
                          color: Colors.grey.shade200,
                          child: const Icon(Icons.broken_image, color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l.title, style: const TextStyle(fontWeight: FontWeight.w700)),
                          const SizedBox(height: 4),
                          Text(l.location, style: const TextStyle(color: Colors.grey)),
                          const SizedBox(height: 6),
                          Text(l.description, style: const TextStyle(color: Colors.black54)),
                          const SizedBox(height: 8),
                          Text('€${l.price.toStringAsFixed(0)}',
                              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      children: [
                        IconButton(
                          tooltip: 'Izmeni',
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => ListingFormScreen(editListing: l),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          tooltip: 'Obriši',
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () async {
                            final ok = await showDialog<bool>(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: const Text('Brisanje'),
                                content: const Text('Da li sigurno želiš da obrišeš ovaj stan?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, false),
                                    child: const Text('Ne'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () => Navigator.pop(context, true),
                                    child: const Text('Da'),
                                  ),
                                ],
                              ),
                            );

                            if (ok == true) {
                              app.deleteListing(l.id);
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}