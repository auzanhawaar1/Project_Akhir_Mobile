import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:posttest5/pages/animation_page.dart';


class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      next: Text("Next"),
      done: Text("Done"),
      onDone: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Selamat Datang di Aplikasi Goat Access"),
              content: Text("Terima kasih Telah Melihat. Anda sekarang dapat mulai menggunakan aplikasi Goat Access."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return AnimationPage();
                        },
                      ),
                    );
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      },
      pages: [
        PageViewModel(
          title: "Pesan Goat Ride , Goat Car , Goat Food",
          body:
              "Silahkan Order Dan Pasti Tepat Waktu",
          image: Image.asset('../assets/logo3.png'),
        ),
        PageViewModel(
          title: "Goat Ride",
          body:
              "'Lebih Cepat Pasti Lebih Baik dengan Menggunakan Goat Ride'",
          image: Image.asset("../assets/motor.jpg"),
        ),
        PageViewModel(
          title: "Goat Car",
          body:
              "'Anda Akan Lebih Nyaman dan Santai Menggunakan Goat Car'",
          image: Image.asset("../assets/mobil.jpeg"),
        ),
      PageViewModel(
          title: "Goat Food",
          body:
              "Makanan Anda Pasti Datang Tepat Waktu Dengan Goat Food",
          image: Image.asset("../assets/anter.jpeg"),
        ),
      ],
    );
  }
}
