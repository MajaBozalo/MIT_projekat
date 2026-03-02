import 'package:flutter/foundation.dart';
import 'package:mit_projekat/models/listing.dart';
import 'package:mit_projekat/screens/guests_screen.dart';

class AppUser {
  final String email;
  final String role; // 'guest', 'registered', 'admin'

  const AppUser({
    required this.email,
    required this.role,
  });
}

class AppState extends ChangeNotifier {
  AppUser? _user;

  AppUser? get user => _user;

  final List<Listing> _listings = [
    ...GuestHomeScreen.sampleListings,
  ];

  List<Listing> get listings => List.unmodifiable(_listings);

  // ======================
  // AUTH
  // ======================

  void register({required String email, required String password}) {
    _user = AppUser(email: email.trim(), role: 'registered');
    notifyListeners();
  }

  void login({required String email, required String password}) {
    if (email == "admin@gmail.com") {
      _user = AppUser(email: email.trim(), role: 'admin');
    } else {
      _user = AppUser(email: email.trim(), role: 'registered');
    }
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }

  bool get isAdmin => _user?.role == 'admin';
  bool get isRegistered => _user?.role == 'registered';

  // ======================
  // LISTING LOGIC
  // ======================

  void addListing({
    required String title,
    required String location,
    required String description,
    required double price,
    required String imageUrl,
  }) {
    if (_user == null) return;

    final newListing = Listing(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      location: location,
      description: description,
      price: price,
      imageUrl: imageUrl,
      ownerEmail: _user!.email,
    );

    _listings.add(newListing);
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

    final old = _listings[index];

    // Samo vlasnik ili admin smije mijenjati
    if (!isAdmin && old.ownerEmail != _user?.email) return;

    _listings[index] = Listing(
      id: old.id,
      title: title,
      location: location,
      description: description,
      price: price,
      imageUrl: imageUrl,
      ownerEmail: old.ownerEmail,
    );

    notifyListeners();
  }

  void deleteListing(String id) {
    final index = _listings.indexWhere((l) => l.id == id);
    if (index == -1) return;

    final listing = _listings[index];

    // Samo vlasnik ili admin smije brisati
    if (!isAdmin && listing.ownerEmail != _user?.email) return;

    _listings.removeAt(index);
    notifyListeners();
  }
}