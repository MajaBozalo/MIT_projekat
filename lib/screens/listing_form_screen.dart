import 'package:flutter/material.dart';
import '../app_scope.dart';
import '../models/listing.dart';

class ListingFormScreen extends StatefulWidget {
  final Listing? editListing;

  const ListingFormScreen({
    super.key,
    this.editListing,
  });

  @override
  State<ListingFormScreen> createState() => _ListingFormScreenState();
}

class _ListingFormScreenState extends State<ListingFormScreen> {
  late final TextEditingController _title;
  late final TextEditingController _location;
  late final TextEditingController _description;
  late final TextEditingController _price;
  late final TextEditingController _imageUrl;

  final _formKey = GlobalKey<FormState>();

  bool get isEdit => widget.editListing != null;

  @override
  void initState() {
    super.initState();
    final l = widget.editListing;

    _title = TextEditingController(text: l?.title ?? '');
    _location = TextEditingController(text: l?.location ?? '');
    _description = TextEditingController(text: l?.description ?? '');
    _price = TextEditingController(
      text: l != null ? l.price.toStringAsFixed(0) : '',
    );
    _imageUrl = TextEditingController(text: l?.imageUrl ?? '');
  }

  @override
  void dispose() {
    _title.dispose();
    _location.dispose();
    _description.dispose();
    _price.dispose();
    _imageUrl.dispose();
    super.dispose();
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    final app = AppScope.of(context);
    final price =
        double.tryParse(_price.text.replaceAll(',', '.')) ?? 0;

    if (isEdit) {
      // UPDATE
      app.updateListing(
        widget.editListing!.id,
        title: _title.text,
        location: _location.text,
        description: _description.text,
        price: price,
        imageUrl: _imageUrl.text,
      );
    } else {
      // ADD
      final newListing = Listing(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: _title.text,
        location: _location.text,
        description: _description.text,
        price: price,
        imageUrl: _imageUrl.text,
        ownerEmail: app.user!.email,
      );

      app.addListing(newListing);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Izmeni stan' : 'Dodaj stan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _title,
                decoration: const InputDecoration(labelText: 'Naslov'),
                validator: (v) =>
                    (v == null || v.trim().isEmpty)
                        ? 'Unesi naslov'
                        : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _location,
                decoration: const InputDecoration(labelText: 'Lokacija'),
                validator: (v) =>
                    (v == null || v.trim().isEmpty)
                        ? 'Unesi lokaciju'
                        : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _description,
                decoration: const InputDecoration(labelText: 'Opis'),
                validator: (v) =>
                    (v == null || v.trim().isEmpty)
                        ? 'Unesi opis'
                        : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _price,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(labelText: 'Cena (EUR)'),
                validator: (v) {
                  final p =
                      double.tryParse((v ?? '').replaceAll(',', '.'));
                  if (p == null || p <= 0) {
                    return 'Unesi validnu cenu';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _imageUrl,
                decoration:
                    const InputDecoration(labelText: 'URL slike'),
                validator: (v) =>
                    (v == null || v.trim().isEmpty)
                        ? 'Unesi URL slike'
                        : null,
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _save,
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    isEdit
                        ? 'Sačuvaj izmene'
                        : 'Dodaj',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}