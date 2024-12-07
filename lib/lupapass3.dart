import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kostgo/login.dart';

class LupaPass3 extends StatefulWidget {
  final String email;

  const LupaPass3({super.key, required this.email});

  @override
  State<LupaPass3> createState() => _LupaPass3State();
}

class _LupaPass3State extends State<LupaPass3> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  Future<void> _updatePassword() async {
    final newPassword = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      _showMessage('Harap isi semua kolom');
      return;
    }

    if (newPassword != confirmPassword) {
      _showMessage('Password tidak cocok');
      return;
    }

    try {
      // Update password di Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.email)
          .update({'password': newPassword});

      _showMessage('Password berhasil diperbarui');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } catch (e) {
      _showMessage('Gagal memperbarui password');
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFD3DBEB),
      body: Stack(
        children: [
          Image.asset(
            "images/lupapass1.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Judul
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 62, left: 96, right: 96),
                  child: Text(
                    "Lupa Password",
                    style: GoogleFonts.inter(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffffffff),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  "Mohon isikan dengan detail",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xFFffffff),
                  ),
                ),
              ),
              const SizedBox(height: 120),
              // Masukkan Password Baru
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 29),
                child: Text(
                  "Masukkan Password Baru",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Masukkan password baru",
                    hintStyle: GoogleFonts.inter(
                      color: const Color(0xFFC9C9C9),
                      fontSize: 14,
                    ),
                    prefixIcon: Image.asset(
                      "images/blocked.png",
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 23),
              // Konfirmasi Password Baru
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 29),
                child: Text(
                  "Konfirmasi Password Baru",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 29),
                child: TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Konfirmasi password baru",
                    hintStyle: GoogleFonts.inter(
                      color: const Color(0xFFC9C9C9),
                      fontSize: 14,
                    ),
                    prefixIcon: Image.asset(
                      "images/blocked.png",
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              // Tombol Oke
              Padding(
                padding: const EdgeInsets.only(top: 139),
                child: Center(
                  child: Container(
                    width: 310,
                    height: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFF4C6496),
                    ),
                    child: TextButton(
                      onPressed: _updatePassword,
                      child: Text(
                        "Oke",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
