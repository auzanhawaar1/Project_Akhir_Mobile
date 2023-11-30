import 'package:flutter/material.dart';
import 'login_page.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  double logoSize = 200.0; // Ukuran awal logo
  double titleOffset = 0.0; // Posisi awal judul

  @override
  void initState() {
    super.initState();

    // Mulai animasi saat halaman pertama kali ditampilkan
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        logoSize = 400.0; // Ukuran logo saat animasi dimulai
        titleOffset = 20.0; // Posisi judul saat animasi dimulai
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AnimatedContainer(
                duration: Duration(seconds: 1), // Durasi animasi
                width: logoSize, // Ukuran logo yang dapat diubah
                height: logoSize, // Ukuran logo yang dapat diubah
                child: Image.asset('../assets/logopa.jpeg'), // Ganti dengan path logo Anda.
              ),
              SizedBox(height: titleOffset),
              Text(
                'Selamat Datang di Aplikasi Goat',
                style: TextStyle(
                  fontSize: screenWidth > 600 ? 36 : 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika untuk pergi ke halaman home atau halaman berikutnya
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                ),
                child: Text('Masuk ke Aplikasi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}