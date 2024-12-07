import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kostgo/login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC3C8D1),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 99),
              child: Container(
                width: 360,
                child: Image.asset("images/gambar1.png"), //gambar
              ),
            ),
            SizedBox(
              height: 60, //jarak
            ),
            Text(
              "Aplikasi yang memudahkan mencari\ntempat tinggal yang ideal.\nSiap membantu menemukan kost impianmu.",
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 320,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFF022B60),
              ),
              // tombol
              child: TextButton(
                //tombol
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                child: Text(
                  "Explore Now",
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(
                      0xFFFFFFFF,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
