import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class InputPageBike extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPageBike> {

  final TextEditingController _ctrlName = TextEditingController();
  final TextEditingController _ctrlPemesanan1 = TextEditingController();
  final TextEditingController _ctrlPemesanan2 = TextEditingController();
  final TextEditingController _ctrlAlamat1 = TextEditingController();
  final TextEditingController _ctrlAlamat2 = TextEditingController();
  TextEditingController _ctrldeliveryTime = TextEditingController();
  final TextEditingController _ctrlvalue = TextEditingController();
  final TextEditingController _ctrlWaktu = TextEditingController();
  
  String? name = '';
  String? Pemesanan1 = '';
  String? Pemesanan2 = '';
  String? Alamat1 = '';
  String? Alamat2 = '';
  String? deliveryTime = '';
  String? value = '';
  String? Waktu = '';

  @override
  void dispose() {
    _ctrlName.dispose();
    _ctrlPemesanan1.dispose();
    _ctrlPemesanan2.dispose();
    _ctrlAlamat1.dispose();
    _ctrlAlamat2.dispose();
    _ctrldeliveryTime.dispose();
    _ctrlvalue.dispose();
    _ctrlWaktu.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _ctrlName.addListener(_printLatestNama);
    _ctrlPemesanan1.addListener(_printLatestPemesanan1);
    _ctrlPemesanan2.addListener(_printLatestPemesanan2);
    _ctrlAlamat1.addListener(_printLatestAlamat1);
    _ctrlAlamat2.addListener(_printLatestAlamat2);
    _ctrldeliveryTime.addListener(_printLatestdeliveryTime);
    _ctrlvalue.addListener(_printLatestvalue);
  }

  void _printLatestNama() {
    print('Nama : ${_ctrlName.text}');
  }

  void _printLatestPemesanan1() {
    print('Pemesanan1: ${_ctrlPemesanan1.text}');
  }

  void _printLatestPemesanan2() {
    print('Pemesanan2: ${_ctrlPemesanan2.text}');
  }

  void _printLatestAlamat1() {
    print('Alamat1: ${_ctrlAlamat1.text}');
  }

  void _printLatestAlamat2() {
    print('Alamat2: ${_ctrlAlamat2.text}');
  }

  void _printLatestdeliveryTime() {
    print('delivery Time: ${_ctrldeliveryTime.text}');
  }

  void _printLatestvalue() {
    print('Value: ${_ctrlvalue.text}');
  }

  @override
  Widget build(BuildContext context) {
    
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference inputbike = firestore.collection("Input_bike");

    final mediaQuery = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Goat App'),
          backgroundColor: Color.fromARGB(255, 29, 165, 210),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nama Anda:'),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  controller: _ctrlName,
                ),

                SizedBox(height: mediaQuery.size.height * 0.02),
                Text('Masukkan Alamat Anda:'),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      Alamat1 = value;
                    });
                  },
                  controller: _ctrlAlamat1,
                ),

                SizedBox(height: mediaQuery.size.height * 0.02),
                Text('Masukkan Alamat Tujuan:'),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      Alamat2 = value;
                    });
                  },
                  controller: _ctrlAlamat2,
                ),

                SizedBox(height: mediaQuery.size.height * 0.02),
                Text('Silahkan Masukkan Alamat Detail :'),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      Pemesanan2 = value;
                    });
                  },
                  controller: _ctrlPemesanan2,
                ),

                SizedBox(height: mediaQuery.size.height * 0.02),
                Text('Lanjutan:'),
                Row(
                  children: [
                    Radio(
                      value: 'Atur Waktu',
                      groupValue: deliveryTime,
                      onChanged: (value) {
                        setState(() {
                          deliveryTime = value!;
                           _ctrldeliveryTime.text = "Atur Waktu" ;
                        });
                      },
                      
                    ),
                    Text('Atur Waktu'),
                    Radio(
                      value: 'Sekarang',
                      groupValue: deliveryTime,
                      onChanged: (value) {
                        setState(() {
                          deliveryTime = value!;
                          _ctrldeliveryTime.text = "Sekarang" ;
                        });
                      },
                    ),
                    Text('Sekarang'),
                  ],
                ),
                SizedBox(height: mediaQuery.size.height * 0.02),
                Text('Kapan Waktu Driver Datang yang Anda Inginkan:'),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      Waktu = value;
                    });
                  },
                  controller: _ctrlWaktu,
                ),
                SizedBox(height: mediaQuery.size.height * 0.02),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.pushNamed(context, '/home');
                    try {
                      // Validasi Input
                      if (name == null ||
                          name!.isEmpty ||
                          Alamat1 == null ||
                          Alamat1!.isEmpty ||
                          Alamat2 == null ||
                          Alamat2!.isEmpty ||
                          Pemesanan2 == null ||
                          Pemesanan2!.isEmpty ||
                          deliveryTime == null ||
                          deliveryTime!.isEmpty ||
                          Waktu == null ||
                          Waktu!.isEmpty) {
                        throw Exception('Semua kolom harus diisi.');
                      }

                      // Simpan data ke Firestore
                      await inputbike.add({
                        'nama': _ctrlName.text ,
                        'Alamat Anda': _ctrlAlamat1.text,
                        'Alamat Tujuan': _ctrlAlamat2.text ,
                        'Alamat Detail':_ctrlPemesanan2.text,
                        'Lanjutan': _ctrldeliveryTime.text,
                        'Driver Datang': _ctrlWaktu.text,
                      });

                      // Bersihkan input setelah berhasil disimpan
                      _ctrlName.text = '';
                      _ctrlAlamat1.text = '';
                      _ctrlAlamat2.text = '';
                      _ctrlPemesanan2.text = '';
                      _ctrldeliveryTime.text = '';
                      _ctrlWaktu.text = '';

                      // Tampilkan output
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Hasil Input'),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Nama Anda: $name'),
                                Text('Alamat Anda: $Alamat1'),
                                Text('Alamat Tujuan: $Alamat2'),
                                Text('Alamat Detail: $Pemesanan2'),
                                Text('Lanjutan: $deliveryTime'),
                                Text('Driver Datang: $Waktu'),
                              ],
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Color.fromARGB(255, 29, 165, 210),
                                ),
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } catch (e) {
                      // Tangani kesalahan
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Harap isi Seluruh Kolom'),
                            content: Text(e.toString()),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Color.fromARGB(255, 29, 165, 210),
                                ),
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text('Simpan'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 29, 165, 210),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
