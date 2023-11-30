import 'package:flutter/material.dart';

class InputPageFood extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPageFood> {
  String name = '';
  String Pemesanan1 = '';
  String Pemesanan2 = '';
  String Alamat1 = '';
  String Alamat2 = '';
  String deliveryTime = '';
  String Waktu = '';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Goat App'),
        backgroundColor: Color.fromARGB(255, 0, 129, 112),
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
              ),

              SizedBox(height: mediaQuery.size.height * 0.02),
              Text('Masukkan Kota Anda:'),
              TextField(
                onChanged: (value) {
                  setState(() {
                    Pemesanan1 = value;
                  });
                },
              ),

              SizedBox(height: mediaQuery.size.height * 0.02),
              Text('Masukkan Alamat Restoran:'),
              TextField(
                onChanged: (value) {
                  setState(() {
                    Alamat1 = value;
                  });
                },
              ),

              SizedBox(height: mediaQuery.size.height * 0.02),
              Text('Masukkan Alamat Pengiriman:'),
              TextField(
                onChanged: (value) {
                  setState(() {
                    Alamat2 = value;
                  });
                },
              ),

              SizedBox(height: mediaQuery.size.height * 0.02),
              Text('Silahkan Tulis Makanan / Minuman Apa Yang Anda Ingin Pesan :'),
              TextField(
                onChanged: (value) {
                  setState(() {
                    Pemesanan2 = value;
                  });
                },
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
              ),

              SizedBox(height: mediaQuery.size.height * 0.02),
              ElevatedButton(
                onPressed: () {
                  // Check if required fields are filled
                  if (name.isEmpty ||
                      Pemesanan1.isEmpty ||
                      Alamat1.isEmpty ||
                      Alamat2.isEmpty ||
                      Pemesanan2.isEmpty ||
                      deliveryTime.isEmpty ||
                      Waktu.isEmpty) {
                    // If any field is empty, show an error dialog
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Please fill in all the required fields.'),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.red,
                              ),
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    // If all fields are filled, show the result dialog
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
                              Text('Kota Anda: $Pemesanan1'),
                              Text('Alamat Restoran: $Alamat1'),
                              Text('Alamat Pengiriman: $Alamat2'),
                              Text('Makanan Dan Minuman: $Pemesanan2'),
                              Text('Lanjutan: $deliveryTime'),
                              Text('Pemesanan Datang: $Waktu'),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Color.fromARGB(255, 0, 129, 112),
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
                  backgroundColor: Color.fromARGB(255, 0, 129, 112),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
