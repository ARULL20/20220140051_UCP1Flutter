import 'package:flutter/material.dart';

class PiketGudangPage extends StatefulWidget {
  const PiketGudangPage({Key? key}) : super(key: key);

  @override
  State<PiketGudangPage> createState() => _PiketGudangPageState();
}

class _PiketGudangPageState extends State<PiketGudangPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController tugasController = TextEditingController();
  DateTime? selectedDate;
  List<String> tugasList = [];

  String? namaError;
  String? tanggalError;
  String? tugasError;

  final primaryColor = Color.fromARGB(255, 252, 2, 2); // Warna oranye seperti contoh

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        tanggalError = null;
      });
    }
  }

  void tambahTugas() {
    setState(() {
      namaError = namaController.text.trim().isEmpty ? 'Nama tidak boleh kosong' : null;
      tanggalError = selectedDate == null ? 'Tanggal harus dipilih' : null;
      tugasError = tugasController.text.trim().isEmpty ? 'Tugas Piket tidak boleh kosong' : null;
    });

    if (namaError == null && tanggalError == null && tugasError == null) {
      setState(() {
        tugasList.add(tugasController.text.trim());
        tugasController.clear();
      });
    }
  }

  @override
  void dispose() {
    namaController.dispose();
    tugasController.dispose();
    super.dispose();
  }