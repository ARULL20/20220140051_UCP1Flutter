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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Piket Gudang'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color(0xFFFFF5F2),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Nama Anggota'),
              const SizedBox(height: 8),
              TextField(
                controller: namaController,
                decoration: InputDecoration(
                  hintText: 'Admin',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  errorText: namaError,
                ),
              ),
              const SizedBox(height: 16),
              const Text('Pilih Tanggal'),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () => _pickDate(context),
                child: AbsorbPointer(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.calendar_today),
                      hintText: selectedDate == null
                          ? 'Pilih Tanggal'
                          : _formatTanggal(selectedDate!),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      errorText: tanggalError,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Tugas Piket'),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: tugasController,
                      decoration: InputDecoration(
                        hintText: 'Tugas Piket',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        errorText: tugasError,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: tambahTugas,
                    child: const Text('Tambah'),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Center(
                child: Text(
                  'Daftar Tugas Piket',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              tugasList.isEmpty
                  ? const Center(child: Text('Belum ada Data'))
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: tugasList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailTugasPage(
                                  nama: namaController.text.trim(),
                                  tanggal: selectedDate!,
                                  tugas: tugasList[index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  tugasList[index],
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }

   String _formatTanggal(DateTime date) {
    List<String> namaHari = [
      "Minggu", "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu"
    ];
    List<String> namaBulan = [
      "Januari", "Februari", "Maret", "April", "Mei", "Juni",
      "Juli", "Agustus", "September", "Oktober", "November", "Desember"
    ];
    return "${namaHari[date.weekday % 7]}, ${date.day} ${namaBulan[date.month - 1]} ${date.year}";
  }
}

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

  @override
  Widget build(BuildContext context) {
    final primaryColor = Color.fromARGB(255, 252, 2, 2);

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