import 'package:flutter/material.dart';
import 'package:posttest5/pages/crud/lihatbike.dart';
import 'package:posttest5/pages/crud/lihatcar.dart';
import 'package:posttest5/pages/crud/lihatfood.dart'; 

class LihatKategoriPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu App', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 29, 165, 210),
      ),
       body: Container(
        color: Colors.blue.shade100, // Ganti warna latar belakang sesuai keinginan Anda
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MenuButton('Go Food History', Icons.fastfood, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => lihatfood()),
                  );
                }),
                SizedBox(height: 16.0),
                MenuButton('Go Bike History', Icons.directions_bike, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LihatData()),
                  );
                }),
                SizedBox(height: 16.0),
                MenuButton('Go Car History', Icons.directions_car, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LihatDataCar()),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function onPressed;

  MenuButton(this.title, this.iconData, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Panggil fungsi onPressed ketika tombol diklik
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                iconData,
                size: 30.0,
              ),
              SizedBox(width: 10.0),
              Text(
                title,
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios), // You can customize this icon
        ],
      ),
    );
  }
}
