import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rentify"),
      ),
      body: const Center(
        child: Text(
          "Dobrodošli u Rentify aplikaciju!",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}