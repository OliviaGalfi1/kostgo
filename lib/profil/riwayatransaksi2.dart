import 'package:flutter/material.dart';
import 'package:kostgo/profil/riwayatransaksi.dart';
import 'package:kostgo/themes/colors_theme.dart';
import 'package:kostgo/themes/fonts_theme.dart';

class rtransaksi2 extends StatelessWidget {
  const rtransaksi2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35, left: 7, right: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const rTransaksi(),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Riwayat Transaksi",
                        style: semiBoldBlackText.copyWith(fontSize: 16),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const Divider(
                    color:
                        Colors.grey), // Garis pemisah di bawah Pengajuan Sewa
              ],
            ),
          ),
          // Menampilkan gambar dengan posisi padding di bagian atas
          Padding(
            padding: const EdgeInsets.only(
              top: 130,
              left: 50,
            ), // Mengatur jarak dari atas
            child: Image.asset(
              "images/transaksi.png",
              width: 313,
              height: 443,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 689, left: 100),
            child: Container(
              width: 223,
              height: 46,
              decoration: BoxDecoration(
                color: darkBlueColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const rTransaksi(),
                    ),
                  );
                },
                child: Text(
                  "Oke",
                  style: semiBoldWhiteText.copyWith(
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
