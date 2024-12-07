import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:kostgo/lupapass2.dart';

class lupaPassword extends StatelessWidget {
  const lupaPassword({super.key});

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
          // Judul
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
              const SizedBox(
                height: 12,
              ),
              // Judul
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
              const SizedBox(
                height: 120,
              ),
              // Teks
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 29),
                child: Text(
                  "Masukkan Email Anda",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Masukkan Email",
                    hintStyle: GoogleFonts.inter(
                      color: const Color(0xFFC9C9C9),
                      fontSize: 14,
                    ),
                    prefixIcon: Image.asset(
                      "images/Password.png", //icon Lupa Password
                      // width: 18,
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
              const SizedBox(
                height: 50,
              ),
              // Tombol
              Center(
                child: Container(
                  width: 300,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xFF4C6496),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LupaPass2(email: 'email',)),
                      );
                      // Handle next action here
                    },
                    child: Text(
                      "Selanjutnya",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color(
                          0xFFFFFFFF,
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
