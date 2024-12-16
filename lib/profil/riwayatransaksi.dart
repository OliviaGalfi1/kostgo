import 'package:flutter/material.dart';
import 'package:kostgo/profil/profilpage.dart';
import 'package:kostgo/profil/riwayatransaksi2.dart';
import 'package:kostgo/themes/colors_theme.dart';
import 'package:kostgo/themes/fonts_theme.dart';

class rTransaksi extends StatelessWidget {
  const rTransaksi({super.key});

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
                            builder: (context) => const ProfilPage(),
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
          Padding(
            padding: const EdgeInsets.only(
              top: 110,
              left: 29,
            ),
            child: Container(
              width: 80, // Lebar lingkaran
              height: 80, // Tinggi lingkaran
              decoration: BoxDecoration(
                color: darkBlueColor, // Warna lingkaran
                shape: BoxShape.circle, // Bentuk lingkaran
              ),
              child: const Icon(
                Icons.wallet,
                color: whiteColor,
                size: 40,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 120,
              left: 130,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const rtransaksi2(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Container di belakang kedua teks
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 80,
                    width: 200,
                    decoration: BoxDecoration(
                      color: whiteColor, // Warna background container
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pembayaran Kost",
                          style: regularBlackText.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4), // Space between texts
                        Text(
                          "2024/09/13 11:45:00",
                          style: regularBlackText.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
