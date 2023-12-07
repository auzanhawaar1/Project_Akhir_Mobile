import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> register(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Akses user yang baru dibuat menggunakan userCredential.user
      User? user = userCredential.user;
      print("Registration successful: ${user?.uid}");
    } catch (e) {
      print("Registration failed: $e");
      // Tangani kegagalan registrasi, misalnya, tampilkan pesan kesalahan ke pengguna
    }
  }


  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      // Tangani kesalahan login di sini
      print("Login failed: $e");
      throw Exception("Login failed: $e");
    }
  }
}
