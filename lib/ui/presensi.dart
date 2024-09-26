import 'package:flutter/material.dart';
import 'package:tugas_pertemuan3/ui/sidemenu.dart';

class Presensi extends StatelessWidget {
  const Presensi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presensi Anda'),
        backgroundColor: const Color.fromARGB(255, 255, 108, 226), // Sesuaikan warna
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 14, 14, 14),
              Color.fromARGB(255, 148, 75, 191),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: const Text(
            "Ini halaman presensi mahasiswa",
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Warna teks yang kontras
            ),
          ),
        ),
      ),
      drawer: const Sidemenu(),
    );
  }
}
