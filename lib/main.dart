import 'package:ucp1pamlanjut/login_page.dart';
import 'package:flutter/material.dart';
import 'package:ucp1pamlanjut/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 58, 152, 183)),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/register' : (context) => const RegisterPage(),
        

      },
      debugShowCheckedModeBanner: false,
    );
  }
}