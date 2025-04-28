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

   Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        tanggalController.text =
            '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
      });
    }
  }

   @override
  void dispose() {
    tanggalController.dispose();
    jumlahBarangController.dispose();
    hargaSatuanController.dispose();
    super.dispose();
  }

  void updateHarga() {
    if (selectedJenisBarang != null) {
      int hargaPerItem = hargaBarang[selectedJenisBarang!] ?? 0;
      int jumlah = int.tryParse(jumlahBarangController.text) ?? 1;
      int totalHarga = hargaPerItem * jumlah;
      hargaSatuanController.text = totalHarga.toString();
    }
  }

void validateForm() {
    setState(() {
      tanggalError = tanggalController.text.isEmpty ? 'Tanggal tidak boleh kosong' : null;
      jenisTransaksiError = selectedJenisTransaksi == null ? 'Pilih jenis transaksi' : null;
      jenisBarangError = selectedJenisBarang == null ? 'Pilih jenis barang' : null;
      jumlahBarangError = jumlahBarangController.text.isEmpty ? 'Jumlah barang tidak boleh kosong' : null;
    });

 if (tanggalError == null &&
        jenisTransaksiError == null &&
        jenisBarangError == null &&
        jumlahBarangError == null) {
      // Semua valid, langsung ke halaman detail sukses
      int hargaPerItem = hargaBarang[selectedJenisBarang!] ?? 0;
      int jumlah = int.tryParse(jumlahBarangController.text) ?? 1;
      int totalHarga = hargaPerItem * jumlah;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailSuksesPage(
            tanggal: tanggalController.text,
            jenisTransaksi: selectedJenisTransaksi!,
            jenisBarang: selectedJenisBarang!,
            jumlahBarang: jumlah,
            hargaSatuan: hargaPerItem,
            totalHarga: totalHarga,
          ),
        ),
      );
    }
  }