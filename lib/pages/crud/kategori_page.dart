import 'package:flutter/material.dart';
import 'package:posttest5/pages/crud/inputbike.dart';
import 'package:posttest5/pages/crud/inputcar.dart';
import 'package:posttest5/pages/crud/inputfood.dart'; 

class KategoriPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu App', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 29, 165, 210),
      ),
      body: Container(
        color: Colors.blue.shade100, 
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MenuButton('Go Food', Icons.fastfood, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => inputfood()),
                  );
                }),
                SizedBox(height: 16.0),
                MenuButton('Go Bike', Icons.directions_bike, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InputPageBike()),
                  );
                }),
                SizedBox(height: 16.0),
                MenuButton('Go Car', Icons.directions_car, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InputPageCar()),
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
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
