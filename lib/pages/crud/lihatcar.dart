import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LihatDataCar extends StatefulWidget {
  const LihatDataCar({super.key});

  @override
  State<LihatDataCar> createState() => _LihatDataState();
}

class _LihatDataState extends State<LihatDataCar> {
  final TextEditingController _ctrlName = TextEditingController();
  final TextEditingController _ctrlPemesanan1 = TextEditingController();
  final TextEditingController _ctrlPemesanan2 = TextEditingController();
  final TextEditingController _ctrlAlamat1 = TextEditingController();
  final TextEditingController _ctrlAlamat2 = TextEditingController();
  final TextEditingController _ctrldeliveryTime = TextEditingController();
  final TextEditingController _ctrlWaktu = TextEditingController();

  final notifEdit = SnackBar(
    content: Text(
      "Data Berhasil Diubah.",
      style: TextStyle(color: Colors.black),
    ),
    duration: Duration(seconds: 3),
    padding: EdgeInsets.all(10),
    backgroundColor: Color.fromARGB(255, 228, 174, 245),
  );

  final notifHapus = SnackBar(
    content: Text(
      "Data Berhasil Dihapus.",
      style: TextStyle(color: Colors.black),
    ),
    duration: Duration(seconds: 3),
    padding: EdgeInsets.all(10),
    backgroundColor: Color.fromARGB(255, 228, 174, 245),
  );

  Future<dynamic> editData(
      BuildContext context,
      String name,
      String Pemesanan1,
      String Alamat1,
      String Alamat2,
      String Pemesanan2,
      String deliveryTime,
      String Waktu,
      String id) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference inputcar = firestore.collection("Input_car");

    _ctrlName.text = name;
    _ctrlPemesanan1.text = Pemesanan1;
    _ctrlAlamat1.text = Alamat1;
    _ctrlAlamat2.text = Alamat2;
    _ctrlPemesanan2.text = Pemesanan2;
    _ctrldeliveryTime.text = deliveryTime;
    _ctrlWaktu.text = Waktu;

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Data"),
          content: Container(
            height: 500,
            width: 300, 
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nama',
                  ),
                  controller: _ctrlName,
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Kategori Mobil',
                  ),
                  controller: _ctrlPemesanan1,
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Alamat Anda',
                  ),
                  controller: _ctrlAlamat1,
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Alamat Tujuan',
                  ),
                  controller: _ctrlAlamat2,
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Alamat Detail',
                  ),
                  controller: _ctrlPemesanan2,
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Lanjutan',
                  ),
                  controller: _ctrldeliveryTime,
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Driver',
                  ),
                  controller: _ctrlWaktu,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                inputcar.doc(id).update({
                  "nama": _ctrlName.text,
                  "Kategori Mobil":_ctrlPemesanan1,
                  "Alamat Anda": _ctrlAlamat1.text,
                  "Alamat Tujuan": _ctrlAlamat2.text,
                  "Alamat Detail": _ctrlPemesanan2.text,
                  "Lanjutan": _ctrldeliveryTime.text,
                  "Driver Datang": _ctrlWaktu.text,
                });
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(notifEdit);
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> hapusData(BuildContext context, String id) {

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference inputcar = firestore.collection("Input_car");


    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Hapus Data"),
          content: Text("Anda yakin ingin menghapus data ini ?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                inputcar.doc(id).delete();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(notifHapus);
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  ListTile DataPemesanan(String name, String Pemesanan1, String Alamat1, String Alamat2,
      String Pemesanan2, String deliveryTime, String Waktu, String id) {
    return ListTile(
      title: Text("Nama : " + name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 5.0),
            child: Text("Kategori Mobil : " + Pemesanan1),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 5.0),
            child: Text("Alamat Anda : " + Alamat1),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 8.0), 
            child: Text("Alamat Tujuan : " + Alamat2),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 8.0),
            child: Text("Alamat Detail : " + Pemesanan2),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 8.0), 
            child: Text("Lanjutan : " + deliveryTime),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 8.0), 
            child: Text("Driver Datang : " + Waktu),
          ),
        ],
      ),
      onTap: () {
        editData(context, name, Pemesanan1, Alamat1, Alamat2, Pemesanan2, deliveryTime,
            Waktu, id);
      },
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(45),
      ),
      leading: IconButton(
        onPressed: () {
          hapusData(context, id);
        },
        icon: Icon(Icons.delete),
      ),
    );
  }

  @override
Widget build(BuildContext context) {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference inputcar = firestore.collection("Input_car");
  return SafeArea(
    child: Scaffold(
      appBar: AppBar(
        title: Text("Halaman Tampil Data", style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromARGB(255, 29, 165, 210),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: inputcar.snapshots(),
                  builder: (_, snapshot) {
                    return (snapshot.hasData)
                        ? Column(
                            children: snapshot.data!.docs
                                .map(
                                  (e) => Column(
                                    children: [
                                      DataPemesanan(
                                          e.get('nama'),
                                          e.get('Kategori Mobil'),
                                          e.get('Alamat Anda'),
                                          e.get('Alamat Tujuan'),
                                          e.get('Alamat Detail'),
                                          e.get('Lanjutan'),
                                          e.get('Driver Datang'),
                                          e.id),
                                      SizedBox(
                                          height:
                                              15.0), 
                                    ],
                                  ),
                                )
                                .toList(),
                          )
                        : Text('Loading...');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.blue.shade100,
    ),
  );
}
}