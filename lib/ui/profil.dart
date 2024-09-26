import 'package:flutter/material.dart';
import 'package:tugas_pertemuan3/ui/sidemenu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  String? email;
  String? password;
  String? nama;

  void _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('username');
    password = 'password'; // Placeholder, pertimbangkan untuk mengamankan ini
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Akun'),
        backgroundColor: const Color.fromARGB(255, 255, 108, 226),
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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProfileSection('Nama:', nama ?? 'Claresta Berthalita Jatmika'),
                _buildProfileSection('Email:', email ?? 'bertha@gmail.com'),
                _buildPasswordSection(),
              ],
            ),
          ),
        ),
      ),
      drawer: const Sidemenu(),
    );
  }

  Widget _buildProfileSection(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20), // Spacing between sections
      ],
    );
  }

  Widget _buildPasswordSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password:',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        const SizedBox(height: 5),
        TextField(
          obscureText: true,
          decoration: const InputDecoration(
            hintText: 'Password',
            hintStyle: TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.white,
            border: InputBorder.none, // Hilangkan border
          ),
          controller: TextEditingController(text: password),
          readOnly: true,
        ),
      ],
    );
  }
}
