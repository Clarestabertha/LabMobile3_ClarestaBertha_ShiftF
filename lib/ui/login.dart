import 'package:flutter/material.dart';
import 'package:tugas_pertemuan3/ui/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  var emailUser;

  void _saveEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Email', _emailController.text);
  }

  _liatInput(controller, placeholder, isPassword) {
  return TextField(
    controller: controller,
    obscureText: isPassword,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      // Ganti labelText dengan hintText agar placeholder tidak hilang
      hintText: placeholder,
      hintStyle: const TextStyle(color: Colors.grey), // Warna teks placeholder
      fillColor: Colors.white, // Warna kolom
      filled: true, // Kolom terisi warna putih
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
    ),
    style: const TextStyle(color: Colors.black), // Warna teks input
  );
}

  _liatPesan(pesan, alamat) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(pesan),
            actions: [
              TextButton(
                child: const Text('OKE'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => alamat,
                      ));
                },
              )
            ],
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teraversa'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 108, 226),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 14, 14, 14), Color.fromARGB(255, 148, 75, 191)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Selamat Datang di Teraversa',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            _liatInput(_emailController, "Masukkan email anda", false),
            const SizedBox(height: 10),
            _liatInput(_pwController, "Masukan password anda", true),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: const Color.fromARGB(255, 255, 108, 226),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white),
              ),
              onPressed: () {
                if (_emailController.text == 'bertha@gmail.com' &&
                    _pwController.text == '123456') {
                  _saveEmail();
                  _liatPesan('Login Berhasil', const Homepage());
                } else {
                  _liatPesan(
                      'Email dan Password yang anda masukkan salah',
                      const Login());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
