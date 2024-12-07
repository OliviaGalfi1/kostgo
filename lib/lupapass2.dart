import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'lupapass3.dart';

class LupaPass2 extends StatefulWidget {
  final String email;

  const LupaPass2({super.key, required this.email});

  @override
  State<LupaPass2> createState() => _LupaPass2State();
}

class _LupaPass2State extends State<LupaPass2> {
  final List<TextEditingController> _otpControllers = List.generate(4, (_) => TextEditingController());

  Future<void> _verifyOtp() async {
    final enteredOtp = _otpControllers.map((controller) => controller.text.trim()).join();

    try {
      // Ambil kode OTP dari Firestore
      final snapshot = await FirebaseFirestore.instance
          .collection('otps')
          .doc(widget.email)
          .get();

      if (!snapshot.exists) {
        _showMessage('Kode OTP tidak ditemukan');
        return;
      }

      final storedOtp = snapshot.data()!['code'];
      if (enteredOtp != storedOtp) {
        _showMessage('Kode OTP salah');
        return;
      }

      _showMessage('Kode OTP berhasil diverifikasi');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LupaPass3(email: 'email',),
        ),
      );
    } catch (e) {
      _showMessage('Terjadi kesalahan saat memverifikasi kode OTP');
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
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFD3DBEB),
      body: Stack(
        children: [
          // Gambar latar belakang
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
                  padding: const EdgeInsets.only(
                    top: 62,
                    left: 96,
                    right: 96,
                  ),
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
                  "Masukkan kode verifikasi",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xFFffffff),
                  ),
                ),
              ),
              const SizedBox(height: 120),

              // Masukkan kode verifikasi
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 29),
                child: Text(
                  "Masukkan Kode Verifikasi",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
              const SizedBox(height: 27),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    4,
                    (index) => SizedBox(
                      width: 39,
                      height: 54,
                      child: TextField(
                        controller: _otpControllers[index],
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          counterText: "",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 3) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Tombol Selanjutnya
              Center(
                child: Container(
                  width: 300,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xFF4C6496),
                  ),
                  child: TextButton(
                    onPressed: _verifyOtp,
                    child: Text(
                      "Selanjutnya",
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
        ],
      ),
    );
  }
}
