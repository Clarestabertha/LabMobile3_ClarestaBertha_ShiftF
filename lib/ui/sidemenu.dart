import 'package:flutter/material.dart';
import 'package:tugas_pertemuan3/ui/profil.dart';
import 'package:tugas_pertemuan3/ui/presensi.dart';
import 'package:tugas_pertemuan3/ui/homepage.dart';

class Sidemenu extends StatelessWidget {
  const Sidemenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
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
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 108, 226), // Warna latar belakang header
              ),
              child: Center(
                child: Text(
                  'Teraversa',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text(
                'Homepage',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Homepage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.white),
              title: const Text(
                'Profil Akun',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Profil(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.check_circle, color: Colors.white),
              title: const Text(
                "Presensi",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Presensi(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
