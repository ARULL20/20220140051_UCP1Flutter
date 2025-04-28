import 'package:flutter/material.dart';

class DetailTugasPage extends StatelessWidget {
  final String nama;
  final DateTime tanggal;
  final String tugas;

  const DetailTugasPage({
    Key? key,
    required this.nama,
    required this.tanggal,
    required this.tugas,
  }) : super(key: key);

  String _formatTanggal(DateTime date) {
    List<String> namaHari = ["Minggu", "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu"];
    List<String> namaBulan = [
      "Januari", "Februari", "Maret", "April", "Mei", "Juni",
      "Juli", "Agustus", "September", "Oktober", "November", "Desember"
    ];
    return "${namaHari[date.weekday % 7]}, ${date.day} ${namaBulan[date.month - 1]} ${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = const Color.fromARGB(255, 252, 2, 2);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Detail $tugas'),
      ),
      backgroundColor: const Color(0xFFFFF5F2),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _formatTanggal(tanggal),
              style: TextStyle(
                color: primaryColor,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  nama,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  tugas,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
