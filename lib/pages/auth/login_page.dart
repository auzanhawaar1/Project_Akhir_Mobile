import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:posttest5/pages/auth/Auth.dart';
import 'package:posttest5/pages/auth/Regis.dart';
import 'package:posttest5/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _loading = false;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _ctrlEmail = TextEditingController();
  final TextEditingController _ctrlPassword = TextEditingController();

  void _showSnackbar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: const Color.fromARGB(255, 29, 165, 210),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  '../assets/logo3.png',
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.2,
                ),
                Text(
                  'Selamat Datang Di Aplikasi Goat',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: screenHeight * 0.03),
                TextFormField(
                  controller: _ctrlEmail,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                TextFormField(
                  controller: _ctrlPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                CupertinoButton(
                    child: Text(
                      'Login',
                      style: TextStyle(decorationColor: Colors.cyanAccent),
                    ),
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) return;

                      final email = _ctrlEmail.value.text;
                      final password = _ctrlPassword.value.text;

                      setState(() => _loading = true);
                      
                      try {
                        await Auth().signIn(email, password);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Login successful!"),
                            duration: Duration(seconds: 3),
                            backgroundColor: Colors.blue,
                          ),
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomePage()),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Failed to login!"),
                            duration: Duration(seconds: 2),
                            backgroundColor:
                                const Color.fromARGB(255, 29, 165, 210),
                          ),
                        );
                      } finally {
                        setState(() => _loading = false);
                      }
                      
                    }),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Regis()),
                    );
                  },
                  child: Text('Belum punya akun? Daftar di sini'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}