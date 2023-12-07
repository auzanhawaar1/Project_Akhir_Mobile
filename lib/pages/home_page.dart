import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:posttest5/provider/setting_screen.dart';
// import 'package:flutter/animation.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goat', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 29, 165, 210),
        actions: [
          TextButton(
            child: Text(
              "Logout",
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),

      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 29, 165, 210),
        child: Column(children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color.fromRGBO(51, 134, 172, 1)),
            accountName: Text('KL Goat'),
            accountEmail: Text('Goat@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("../assets/logo3.png"),
              ),
          ),
          ListTile(
            leading: const Icon(
              Icons.person_outlined,
              color: Colors.white,
            ),
            title: Text("Information", style: TextStyle(color: Colors.white),),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
          ListTile(
            title: Text('Settings', style: TextStyle(color: Colors.white)),
            leading: Icon(Icons.settings, color: Colors.white),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => SettingsScreen(),
                ),
              );
            },
          )
        ]),
      ),
      body: ListView(
        children: [
          Container(
            width: 100,
            height: 250,
            margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
            child: Image.asset(
              '../assets/fotoo.jpg',
              fit: BoxFit.cover,
            ),
          ),
          GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            children: [
              // Kotak 1 - Produk 1
              Container(
                width: 100,
                height: 250,
                margin: EdgeInsets.all(10),
                // color: Colors.red,
                child: Image.asset(
                  '../assets/fotomobil.jpeg',
                  width: 50, // Lebar
                  height: 50, // Tinggi
                ),
              ),

              // Kotak 2 - Produk 2
              Container(
                width: 100,
                height: 250,
                margin: EdgeInsets.all(10),
                // color: Colors.blue,
                child: Image.asset(
                  '../assets/food.jpeg',
                  width: 50, // Lebar
                  height: 50, // Tinggi
                ),
              ),

              // Kotak 3 - Produk 3
              Container(
                width: 100,
                height: 250,
                margin: EdgeInsets.all(10),
                // color: Colors.green,
                child: Image.asset(
                  '../assets/fotomotor.jpeg',
                  width: 50, // Lebar
                  height: 50, // Tinggi
                ),
              ),
            ],
          ),
        ],
      ),

      //NAVBAR BAWAH
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 29, 165, 210),
        unselectedItemColor: Colors.white,
        selectedItemColor: Color.fromARGB(255, 4, 57, 88),
        currentIndex: 0,
        onTap: (index) {
          if (index == 2) {
            Navigator.pushNamed(context, '/lihatkategori');
          }
          if (index == 1) {
            Navigator.pushNamed(context, '/input');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart_outlined),
            label: "Order",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.read_more),
            label: "History",
          ),
        ],
      ),
    );
  }
}
