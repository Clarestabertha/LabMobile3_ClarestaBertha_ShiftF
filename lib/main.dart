import 'package:flutter/material.dart';
import 'package:tugas_pertemuan3/ui/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Presensi Mahasiswa',
      home: Login(),
    );
  }
}
