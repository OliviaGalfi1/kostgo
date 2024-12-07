import 'package:flutter/material.dart';
import 'package:kostgo/chat/chatDetailPage%20(2).dart';
import 'package:kostgo/profil/detail_kost_mawar.dart';
import 'package:kostgo/themes/colors_theme.dart';
import 'package:kostgo/themes/fonts_theme.dart';

class pSewa extends StatelessWidget {
  const pSewa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                        Navigator.pop(context); // Back to previous page
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
                        "Pengajuan Sewa",
                        style: semiBoldBlackText.copyWith(fontSize: 16),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const Divider(
                    color: Colors.grey), // Divider below Pengajuan Sewa
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 110, left: 15, right: 15),
            child: Container(
              width: double.infinity,
              height: 330,
              decoration: BoxDecoration(
                color: darkBlueColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Kost Rumah Mawar Tipe A",
                          style: semiBoldBlackText.copyWith(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            "Wanita",
                            style: regularBlackText.copyWith(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.asset(
                            'images/rumahkostmawartipea.jpg',
                            width: 97,
                            height: 130,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Banda Sakti",
                                style: regularWhiteText.copyWith(fontSize: 12),
                              ),
                              const SizedBox(height: 50),
                              Text(
                                "K. Mandi Dalam, Wifi, Dll.",
                                style: regularWhiteText.copyWith(fontSize: 12),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Harga: Rp 500.000/bulan",
                                style: semiBoldBlackText.copyWith(
                                  fontSize: 14,
                                  color: Colors.yellowAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tanggal masuk",
                              style: regularWhiteText.copyWith(fontSize: 12),
                            ),
                            Text(
                              "14/09/2024",
                              style: regularWhiteText.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Durasi Sewa",
                              style: regularWhiteText.copyWith(fontSize: 12),
                            ),
                            Text(
                              "1 Bulan",
                              style: regularWhiteText.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailKostMawar(),
                              ),
                            );
                          },
                          child: Text(
                            "Lihat Detail",
                            style: semiBoldToskaText.copyWith(
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(color: Colors.grey),
                    Padding(
                      padding: EdgeInsets.only(top: 15, left: 184),
                      child: Container(
                        width: 160,
                        height: 40,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatDetailPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Tanya Pemilik",
                            style: semiBoldBlueText.copyWith(
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
