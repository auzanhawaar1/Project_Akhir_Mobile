import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key});

  @override
  State<About> createState() => _About();
}

class _About extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 29, 165, 210),
        centerTitle: true,
        title: Text("About Us", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          _buildProfile(
            "Auzan Hawaari Fahrony",
            "C21",
            "2109106127",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0b7F9LvhEPTpHZLzO1gvbONtif4JjaD_UcOBFbFu0lqd7i_qo9DtR1iBbl8jmRd44YeE&usqp=CAU",
          ),
          _buildProfile(
            "Arif Wijaksono",
            "C21",
            "2109106129",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0b7F9LvhEPTpHZLzO1gvbONtif4JjaD_UcOBFbFu0lqd7i_qo9DtR1iBbl8jmRd44YeE&usqp=CAU",
          ),
          _buildProfile(
            "M andry Rivail",
            "C21",
            "2109106121",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0b7F9LvhEPTpHZLzO1gvbONtif4JjaD_UcOBFbFu0lqd7i_qo9DtR1iBbl8jmRd44YeE&usqp=CAU",
          ),
          _buildProfile(
            "Moh. Davis VA",
            "C21",
            "2109106119",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0b7F9LvhEPTpHZLzO1gvbONtif4JjaD_UcOBFbFu0lqd7i_qo9DtR1iBbl8jmRd44YeE&usqp=CAU",
          ),
        ],
      ),
    );
  }

  Widget _buildProfile(String name, String classInfo, String id, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 80,
            ),
            SizedBox(height: 20),
            Text(
              name,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              classInfo,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              id,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
