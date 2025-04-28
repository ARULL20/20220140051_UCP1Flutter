import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
import 'pendataan_barang_page.dart';
import 'piket_gudang_page.dart';
import 'data_pelanggan_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String namaUser = 'Admin';

  @override
  void initState() {
    super.initState();
    loadUserData();
  }