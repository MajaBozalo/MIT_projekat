import 'package:flutter/foundation.dart';
import 'package:mit_projekat/models/listing.dart';
import 'package:mit_projekat/screens/guests_screen.dart';

class AppUser {
  final String email;
  final String role;
  const AppUser({required this.email, required this.role});
}

class AppState extends ChangeNotifier {
  AppUser? _user;
  AppUser? get user => _user;

  final List<Listing> _listings = [
    ...GuestHomeScreen.sampleListings,
  ];

  List<Listing> get listings => List.unmodifiable(_listings);

  void register({required String email, required String password}) {
    _user = AppUser(email: email.trim(), role: 'registered');
    notifyListeners();
  }

  void login({required String email, required String password}) {
    _user = AppUser(email: email.trim(), role: 'registered');
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }

  void addListing({
    required String title,
    required String location,
    required String description,
    required double price,
    required String imageUrl,
  }) {
    final id = DateTime.now().microsecondsSinceEpoch.toString();
    _listings.insert(
      0,
      Listing(
        id: id,
        title: title.trim(),
        location: location.trim(),
        description: description.trim(),
        price: price,
        imageUrl: imageUrl.trim(),
      ),
    );
    notifyListeners();
  }

  void updateListing(
    String id, {
    required String title,
    required String location,
    required String description,
    required double price,
    required String imageUrl,
  }) {
    final index = _listings.indexWhere((l) => l.id == id);
    if (index == -1) return;

    _listings[index] = Listing(
      id: id,
      title: title.trim(),
      location: location.trim(),
      description: description.trim(),
      price: price,
      imageUrl: imageUrl.trim(),
    );
    notifyListeners();
  }

  void deleteListing(String id) {
    _listings.removeWhere((l) => l.id == id);
    notifyListeners();
  }
}