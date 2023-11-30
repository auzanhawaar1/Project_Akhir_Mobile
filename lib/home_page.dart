import 'package:flutter/material.dart';
import 'package:posttest5/kategori_page.dart';
import 'package:posttest5/setting_screen.dart';
import 'package:flutter/animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grab App Input',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      useMaterial3: true,
    ),
      routes: {
        '/':(context) => const MyHomePage(),
        '/second':(context) => KategoriPage(),
    });
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goat'),
        backgroundColor: Color.fromARGB(255, 23, 107, 135),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 23, 107, 135),
        child : Column(children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(51, 134, 172, 1)
            ),
            accountName: Text('Auzan Hawaari'), 
            accountEmail: Text('AuzanHawaari@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0b7F9LvhEPTpHZLzO1gvbONtif4JjaD_UcOBFbFu0lqd7i_qo9DtR1iBbl8jmRd44YeE&usqp=CAU"),
            ),
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                ),
                title: Text("Personal Chat"),
                onTap: (){},
            ),
             ListTile(
              leading: const Icon(
                Icons.mail,
                ),
                title: Text("Kirim Email"),
                onTap: (){},
            ),
            ListTile(
                leading: const Icon(
                  Icons.person_outlined,
                ),
                title: Text("Your Information"),
                onTap: (){
                  Navigator.pushNamed(context, '/about');
                },
              ),
              ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
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
       //PROMOSI
      body: ListView(
        children: [
          Container(
            width: 100,
            height: 250,
            margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
            child: Image.asset(
              '../assets/gambar1.png',
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
                child: Image.asset('../assets/gambar2.jpeg',
                width: 50, // Lebar
                height: 50, // Tinggi
                // fit: BoxFit.cover
                ),
              ),

              // Kotak 2 - Produk 2
              Container(
                width: 100,
                height: 250,
                margin: EdgeInsets.all(10),
                // color: Colors.blue,
                child: Image.asset('../assets/gambar2.jpeg',
                width: 50, // Lebar
                height: 50, // Tinggi
                // fit: BoxFit.cover
                ),
              ),

              // Kotak 3 - Produk 3
              Container(
                width: 100,
                height: 250,
                margin: EdgeInsets.all(10),
                // color: Colors.green,
                child: Image.asset('../assets/gambar2.jpeg',
                width: 50, // Lebar
                height: 50, // Tinggi
                // fit: BoxFit.cover
                ),                
              ),
              
            ],
          ),
        ],
      ),
      //NAVBAR BAWAH
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 23, 107, 135),
        unselectedItemColor: Colors.white,
        selectedItemColor: Color.fromARGB(255, 93, 253, 0),
        currentIndex: 0,
        onTap: (index) {
          if (index == 2) {
            Navigator.pushNamed(context, '/input');
          }
          if (index == 1){
            Navigator.pushNamed(context,'/intro');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_rounded),
            label: "Introduction",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart_outlined),
            label: "Shop",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
        ],
      ),
    );
  }
}