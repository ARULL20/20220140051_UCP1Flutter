import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'register_page.dart';
import 'dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true; // Untuk toggle password
  String? emailError;
  String? passwordError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF7F4),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            const Icon(Icons.flutter_dash, size: 100, color: Colors.black),
            const SizedBox(height: 20),
            const Text(
              'SELAMAT DATANG KEMBALI',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 40),
            _buildTextField(
              label: 'Email',
              icon: Icons.email,
              controller: emailController,
              errorText: emailError,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: 'Password',
              icon: Icons.lock,
              isPassword: true,
              controller: passwordController,
              errorText: passwordError,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF52FFDA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 4,
                ),
                onPressed: () async {
                  setState(() {
                    emailError = emailController.text.isEmpty ? 'Email tidak boleh kosong' : null;
                    passwordError = passwordController.text.isEmpty ? 'Password tidak boleh kosong' : null;
                  });

                  if (emailError != null || passwordError != null) {
                    return;
                  }

                  final prefs = await SharedPreferences.getInstance();
                  String? savedEmail = prefs.getString('email');
                  String? savedPassword = prefs.getString('password');

                  if (emailController.text == savedEmail &&
                      passwordController.text == savedPassword) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const DashboardPage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Email atau Password salah')),
                    );
                  }
                },
                child: const Text('Masuk', style: TextStyle(fontSize: 16)),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                );
              },
              child: const Text('Belum Memiliki akun? Daftar disini!'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }