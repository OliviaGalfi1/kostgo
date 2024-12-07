import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.asset(
              "images/register.png",
              fit: BoxFit.cover,
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Judul
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 95,
                      left: 97,
                      right: 88,
                    ),
                    child: Text(
                      "Daftar Akun ",
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFFFFFFF),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Center(
                  child: Text(
                    "Isi data registrasi berikut dengan benar",
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                ),
                const SizedBox(height: 31),
                // Nama
                _buildTextField(
                  controller: _namaController,
                  hint: "Masukkan nama",
                  iconPath: "images/nama.png",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon masukkan nama';
                    }
                    if (value.length < 3) {
                      return 'Nama harus lebih dari 2 karakter';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 26),
                // Email
                _buildTextField(
                  controller: _emailController,
                  hint: "Masukkan email",
                  iconPath: "images/username.png",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon masukkan email';
                    }
                    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                    if (!emailRegExp.hasMatch(value)) {
                      return 'Email tidak valid';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 26),
                // Password
                _buildTextField(
                  controller: _passwordController,
                  hint: "Masukkan password",
                  iconPath: "images/blocked.png",
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mohon masukkan password';
                    }
                    if (value.length < 8) {
                      return 'Password harus minimal 8 karakter';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 80),
                // Tombol
                Center(
                  child: _isLoading
                      ? const CircularProgressIndicator()
                      : Container(
                          width: 350,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xFF4C6496),
                          ),
                          child: TextButton(
                            onPressed: () => _handleRegister(context),
                            child: Text(
                              "Daftarkan",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required String iconPath,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 31),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hint,
          hintStyle: GoogleFonts.inter(
            color: const Color(0xFFC9C9C9),
            fontSize: 14,
          ),
          prefixIcon: Image.asset(iconPath),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
        validator: validator,
      ),
    );
  }

  Future<void> _handleRegister(BuildContext context) async {
  if (!_formKey.currentState!.validate()) return;

  setState(() {
    _isLoading = true;
  });

  try {
    // Membuat pengguna baru di Firebase Authentication
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    // Simpan data pengguna ke Firestore
    await _firestore.collection('users').doc(userCredential.user!.uid).set({
      'nama': _namaController.text.trim(),
      'email': _emailController.text.trim(),
      'created_at': FieldValue.serverTimestamp(),
    });

    // Menampilkan Toast untuk memberitahu pengguna bahwa registrasi berhasil
    Fluttertoast.showToast(
      msg: 'Registrasi berhasil! Silakan login.',
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );

    // Navigasi ke halaman login setelah data berhasil disimpan
    if (mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (route) => false, // Menghapus semua halaman sebelumnya dari stack
      );
    }
  } on FirebaseAuthException catch (e) {
    String message;
    // Menangani berbagai jenis kesalahan dari Firebase Authentication
    if (e.code == 'weak-password') {
      message = 'Password terlalu lemah';
    } else if (e.code == 'email-already-in-use') {
      message = 'Email sudah terdaftar';
    } else {
      message = 'Terjadi kesalahan: ${e.message}';
    }
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  } catch (e) {
    // Menangani kesalahan lainnya
    print("Error: $e");
    Fluttertoast.showToast(
      msg: e.toString(),
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  } finally {
    setState(() {
      _isLoading = false;
    });
  }
}


  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
