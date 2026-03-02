// ...existing code...
import 'package:flutter/material.dart';
import 'guests_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _openGuest(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const GuestHomeScreen()),
    );
  }

  void _openLogin(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  void _openAdmin(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const AdminScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(56),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 4,
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Izdavanje stanova'),
        centerTitle: true,
        surfaceTintColor: Colors.transparent, // nicer Material 3 look when supported
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _openGuest(context),
                  icon: const Icon(Icons.travel_explore),
                  label: const Text('Nastavi kao Gost'),
                  style: buttonStyle,
                ),
                const SizedBox(height: 14),
                ElevatedButton.icon(
                  onPressed: () => _openLogin(context),
                  icon: const Icon(Icons.login),
                  label: const Text('Registrovani korisnik'),
                  style: buttonStyle,
                ),
                const SizedBox(height: 14),
                ElevatedButton.icon(
                  onPressed: () => _openAdmin(context),
                  icon: const Icon(Icons.admin_panel_settings),
                  label: const Text('Administrator'),
                  style: buttonStyle.copyWith(
                    backgroundColor: MaterialStateProperty.all(Colors.grey.shade800),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Simple UI-only placeholder for LoginScreen (no backend)
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Login screen (UI only)',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Lozinka', border: OutlineInputBorder()),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {}, child: const Text('Prijavi se')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Simple UI-only placeholder for AdminScreen (no backend)
class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Administrator')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.admin_panel_settings, size: 72, color: Colors.grey),
                SizedBox(height: 12),
                Text('Admin panel (UI only)', style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}