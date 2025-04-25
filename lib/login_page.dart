import 'package:flutter/material.dart';
import 'package:ucp1pamlanjut/register_page.dart';


void main() {
  runApp(const MaterialApp(
    home: LoginPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
            const Icon(Icons.flutter_dash, size: 100, color: Color.fromARGB(255, 0, 0, 0)),
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
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email, color: Color.fromARGB(255, 8, 2, 0)),
                hintText: 'Email',
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock, color: Color.fromARGB(255, 0, 0, 0)),
                suffixIcon: const Icon(Icons.visibility_off),
                hintText: 'Password',
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 82, 255, 218),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 4,
                ),
                onPressed: () {},
                child: const Text(
                  'Masuk',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
             TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text('Belum Memiliki akun? silahkan Daftar disini!'),
              ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Navigasi ke halaman daftar
              },
              child: const Text.rich(
                TextSpan(
                  text: ' ',
                  children: [
                    TextSpan(
                      text: '',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 14, 4),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
