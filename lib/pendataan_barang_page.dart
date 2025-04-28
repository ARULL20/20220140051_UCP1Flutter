import 'package:flutter/material.dart';
import 'DetailSuksesPage.dart'; // Tambahan: import file halaman sukses

class PendataanBarangPage extends StatefulWidget {
  const PendataanBarangPage({Key? key}) : super(key: key);

  @override
  State<PendataanBarangPage> createState() => _PendataanBarangPageState();
}

class _PendataanBarangPageState extends State<PendataanBarangPage> {
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController jumlahBarangController = TextEditingController();
  final TextEditingController hargaSatuanController = TextEditingController();

  final primaryColor = Color.fromARGB(255, 0, 247, 4);