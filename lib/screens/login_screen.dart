import 'package:flutter/material.dart';
import '../app_scope.dart';
import 'registered_home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  void _goRegisteredHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const RegisteredHomeScreen()),
    );
  }

  void _login() {
    final app = AppScope.of(context);
    app.login(email: _emailCtrl.text, password: _passCtrl.text);
    _goRegisteredHome();
  }

  void _register() {
    final app = AppScope.of(context);
    app.register(email: _emailCtrl.text, password: _passCtrl.text);
    _goRegisteredHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prijava / Registracija')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _passCtrl,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Lozinka'),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _login,
                    child: const Text('Prijavi se'),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: _register,
                    child: const Text('Registruj se'),
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