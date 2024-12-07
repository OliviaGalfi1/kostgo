import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'dart:io'; // For SocketException (network issues)

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Reset',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResetPasswordScreen(),
    );
  }
}

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  // Firebase Auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to validate email format
  bool _isValidEmail(String email) {
    final RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  // Function to handle password reset
  Future<void> _sendPasswordResetEmail() async {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      // Show error if email is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Mohon masukkan email yang valid')),
      );
      return;
    }

    if (!_isValidEmail(email)) {
      // Show error if email format is invalid
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email tidak valid. Mohon masukkan email yang benar.')),
      );
      return;
    }

    try {
      // Attempt to send password reset email
      await _auth.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email reset password telah dikirim ke $email')),
      );
      _emailController.clear();  // Clear email field after sending the reset request
    } on FirebaseAuthException catch (e) {
      // Handle Firebase Auth errors with better messages
      String errorMessage = 'Terjadi kesalahan';
      if (e.code == 'user-not-found') {
        errorMessage = 'Tidak ada akun yang ditemukan untuk email tersebut';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'Format email tidak valid';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } on SocketException catch (_) {
      // Catch network error (e.g., no internet connection)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan jaringan. Periksa koneksi internet Anda.')),
      );
    } catch (e) {
      // Handle other general errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
        backgroundColor: Color(0xFF001F54),
      ),
      backgroundColor: Color(0xFF001F54),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Reset Password',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Masukkan email Anda untuk reset password',
                style: TextStyle(
                  color: Colors.grey[300],
                ),
              ),
              SizedBox(height: 32),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email, color: Colors.blue),
                  hintText: 'Masukkan email Anda',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                autofocus: true,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _sendPasswordResetEmail,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: Text('Kirim Email Reset'),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Navigate back to login
                },
                child: Text(
                  'Kembali ke Login',
                  style: TextStyle(
                    color: Colors.blue[400],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Color(0xFFB0C4DE),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(50),
          ),
        ),
      ),
    );
  }
}
