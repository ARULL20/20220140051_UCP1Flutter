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

  String? selectedJenisBarang;
  String? selectedJenisTransaksi;

  String? tanggalError;
  String? jenisTransaksiError;
  String? jenisBarangError;
  String? jumlahBarangError;

  Map<String, int> hargaBarang = {
    'Carrier': 540000,
    'Sleeping Bag': 250000,
    'Tenda': 700000,
    'Sepatu': 350000,
  };