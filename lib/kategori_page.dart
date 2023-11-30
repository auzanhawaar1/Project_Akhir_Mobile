import 'package:flutter/material.dart';
import 'package:posttest5/input_page_bike.dart';
import 'package:posttest5/input_page_car.dart';
import 'package:posttest5/input_page_food.dart'; 

class KategoriPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu App'),
      ),
      body: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MenuButton('Go Food', Icons.fastfood, () {
                // Tambahkan aksi yang diinginkan untuk Menu 1
                print('Menu 1 diklik');
                // Navigasi ke halaman InputGrabPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InputPageFood()),
                );
              }),
              SizedBox(height: 16.0),
              MenuButton('Go Bike', Icons.directions_bike, () {
                // Tambahkan aksi yang diinginkan untuk Menu 2
                print('Menu 2 diklik');
                // Navigasi ke halaman InputGrabPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InputPageBike()),
                );
              }),
              SizedBox(height: 16.0),
              MenuButton('Go Car', Icons.directions_car, () {
                // Tambahkan aksi yang diinginkan untuk Menu 3
                print('Menu 3 diklik');
                // Navigasi ke halaman InputGrabPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InputPageCar()),
                );
              }),
            ],
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
