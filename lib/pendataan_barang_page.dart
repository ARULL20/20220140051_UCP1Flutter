import 'package:flutter/material.dart';
import 'package:ucp1pamlanjut/detailsuksespage.dart';

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
  String? hargaSatuanError;

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
      hargaSatuanError = (hargaSatuanController.text.isEmpty || hargaSatuanController.text == '0')
      ? 'Harga satuan tidak valid'
      : null;
    });

 if (tanggalError == null &&
        jenisTransaksiError == null &&
        jenisBarangError == null &&
        jumlahBarangError == null&&
        hargaSatuanError == null) {
      
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

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Pendataan Barang'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Tanggal Transaksi'),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextField(
                    controller: tanggalController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.calendar_today),
                      hintText: 'Tanggal Transaksi',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      errorText: tanggalError,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Jenis Transaksi'),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: selectedJenisTransaksi,
                items: ['Masuk', 'Keluar'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  hintText: 'Jenis Transaksi',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  errorText: jenisTransaksiError,
                ),
                onChanged: (value) {
                  setState(() {
                    selectedJenisTransaksi = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              const Text('Jenis Barang'),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: selectedJenisBarang,
                items: ['Carrier', 'Sleeping Bag', 'Tenda', 'Sepatu']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  hintText: 'Jenis Barang',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  errorText: jenisBarangError,
                ),
                onChanged: (value) {
                  setState(() {
                    selectedJenisBarang = value;
                    updateHarga();
                  });
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Jumlah Barang'),
                        const SizedBox(height: 8),
                        TextField(
                          controller: jumlahBarangController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Jumlah Barang',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            errorText: jumlahBarangError,
                          ),
                          onChanged: (value) {
                            setState(() {
                              updateHarga();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                   const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Harga Total'),
                        const SizedBox(height: 8),
                        TextField(
                          controller: hargaSatuanController,
                          decoration: InputDecoration(
                            prefixText: 'Rp. ',
                            hintText: 'Harga Satuan',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            errorText: hargaSatuanError,
                          ),
                          readOnly: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
               const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    validateForm();
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
