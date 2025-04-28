import 'package:flutter/material.dart';
import 'detail_pelanggan_page.dart'; // <--- Tambahkan import halaman detail di sini

class DataPelangganPage extends StatefulWidget {
  const DataPelangganPage({Key? key}) : super(key: key);

  @override
  State<DataPelangganPage> createState() => _DataPelangganPageState();
}

class _DataPelangganPageState extends State<DataPelangganPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController provinsiController = TextEditingController();
  final TextEditingController kodePosController = TextEditingController();

  String? namaError;
  String? emailError;
  String? noHpError;
  String? alamatError;
  String? provinsiError;
  String? kodePosError;

  final primaryColor = Color.fromARGB(255, 3, 183, 219);