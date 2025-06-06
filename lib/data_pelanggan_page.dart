import 'package:flutter/material.dart';
import 'detail_pelanggan_page.dart'; 

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

  void validateForm() {
    setState(() {
      namaError = namaController.text.isEmpty ? 'Nama tidak boleh kosong' : null;
      emailError = emailController.text.isEmpty ? 'Email tidak boleh kosong' : null;
      noHpError = noHpController.text.isEmpty ? 'No Hp tidak boleh kosong' : null;
      alamatError = alamatController.text.isEmpty ? 'Alamat tidak boleh kosong' : null;
      provinsiError = provinsiController.text.isEmpty ? 'Provinsi tidak boleh kosong' : null;
      kodePosError = kodePosController.text.isEmpty ? 'Kode Pos tidak boleh kosong' : null;
    });

    if (namaError == null &&
        emailError == null &&
        noHpError == null &&
        alamatError == null &&
        provinsiError == null &&
        kodePosError == null) {
      
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPelangganPage(
            nama: namaController.text,
            email: emailController.text,
            noHp: noHpController.text,
            alamat: alamatController.text,
            provinsi: provinsiController.text,
            kodePos: kodePosController.text,
          ),
        ),
      );
    }
  }

void resetForm() {
    setState(() {
      namaController.clear();
      emailController.clear();
      noHpController.clear();
      alamatController.clear();
      provinsiController.clear();
      kodePosController.clear();

      namaError = null;
      emailError = null;
      noHpError = null;
      alamatError = null;
      provinsiError = null;
      kodePosError = null;
    });
  }

   @override
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    noHpController.dispose();
    alamatController.dispose();
    provinsiController.dispose();
    kodePosController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Data Pelanggan'),
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
              const Text('Nama Cust'),
              const SizedBox(height: 8),
              TextField(
                controller: namaController,
                decoration: InputDecoration(
                  hintText: 'Nama Cust',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  errorText: namaError,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Email'),
                        const SizedBox(height: 8),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            errorText: emailError,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('No Hp'),
                        const SizedBox(height: 8),
                        TextField(
                          controller: noHpController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: 'No Hp',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            errorText: noHpError,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Alamat'),
              const SizedBox(height: 8),
              TextField(
                controller: alamatController,
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: 'Alamat',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  errorText: alamatError,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Provinsi'),
                        const SizedBox(height: 8),
                        TextField(
                          controller: provinsiController,
                          decoration: InputDecoration(
                            hintText: 'Provinsi',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            errorText: provinsiError,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Kode Pos'),
                        const SizedBox(height: 8),
                        TextField(
                          controller: kodePosController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Kode Pos',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            errorText: kodePosError,
                          ),
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
                    'Simpan',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: primaryColor, width: 2),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    resetForm();
                  },
                  child: Text(
                    'Reset',
                    style: TextStyle(
                      fontSize: 16,
                      color: primaryColor,
                    ),
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
