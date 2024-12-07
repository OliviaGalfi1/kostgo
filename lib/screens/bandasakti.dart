import 'package:flutter/material.dart';
import 'package:kostgo/chat/chatDetailPage%20(2).dart';
import 'package:kostgo/screens/kost_mawar_TipeA.dart';
import 'package:kostgo/themes/colors_theme.dart';
import 'package:kostgo/themes/fonts_theme.dart';

class bandasakti extends StatelessWidget {
  const bandasakti({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Scrollable content behind the header
          SingleChildScrollView(
            padding: const EdgeInsets.only(
                top: 110,
                left: 15,
                right: 15), // Adjust top padding to start below the header
            child: Column(
              children: [
                // Kost 1 container
                Container(
                  width: double.infinity,
                  height: 280,
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
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => KosMawar(),
                                  ),
                                );
                              },
                              child: Text(
                                "Kost Mawar",
                                style: semiBoldBlackText.copyWith(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
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
                                'images/bandasaktii.png',
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
                                    style:
                                        regularWhiteText.copyWith(fontSize: 12),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "K. Mandi Dalam, Wifi, Dll.",
                                    style:
                                        regularWhiteText.copyWith(fontSize: 12),
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
                        Padding(
                          padding: EdgeInsets.only(left: 240),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const KosMawar(),
                                  ));
                            },
                            child: Text(
                              "Lihat Detail",
                              style: semiBoldToskaText.copyWith(
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20, left: 184),
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
                // Add some spacing between the two containers
                SizedBox(
                  height: 10,
                ),
                // Kost 2 container
              ],
            ),
          ),
          // Header section
          Container(
            height: 100,
            width: double.infinity,
            color: darkBlueColor,
            padding: const EdgeInsets.only(top: 55, left: 7, right: 15),
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
                        color: whiteColor,
                        size: 25,
                      ),
                    ),
                    SizedBox(
                      width: 275,
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
          // "Rekomendasi Kost Daerah Muara Satu" text
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Container(
              height: 50,
              width: double.infinity,
              color: whiteColor,
              child: Center(
                // Use Center widget to center the text horizontally and vertically
                child: Text(
                  'Rekomendasi Kost Daerah Banda Sakti',
                  style: semiBoldBlackText.copyWith(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
