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