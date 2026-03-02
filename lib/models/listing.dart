class Listing {
  final String id;
  final String title;
  final String location;
  final String description;
  final double price;
  final String imageUrl;
  final String ownerEmail;

  const Listing({
    required this.id,
    required this.title,
    required this.location,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.ownerEmail,
  });
}