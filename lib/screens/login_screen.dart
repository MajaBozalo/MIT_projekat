import 'package:flutter/material.dart';
import 'guests_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prijava"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Lozinka",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {},
              child: const Text("Prijavi se"),
            ),

            const SizedBox(height: 15),

            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GuestHomeScreen(),
                  ),
                );
              },
              child: const Text("Nastavi kao gost"),
            ),
          ],
        ),
      ),
    );
  }
}