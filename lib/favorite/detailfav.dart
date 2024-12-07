import 'package:flutter/material.dart';
import 'package:kostgo/favorite/favorite.dart';
import 'package:kostgo/screens/kost_mawar_TipeA.dart';
import 'package:kostgo/screens/kost_mawar_tipeb.dart';
import 'package:kostgo/themes/colors_theme.dart';
import 'package:kostgo/themes/fonts_theme.dart';

class Detailfav extends StatelessWidget {
  const Detailfav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: 420,
            decoration: const BoxDecoration(color: darkBlueColor),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 9,
                left: 0,
                bottom: 9,
                right: 320,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Favorite(),
                    ),
                  );
                },
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 32,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            child: Text(
              "Favorite",
              style: boldBlackText.copyWith(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Todo Kost Mawar Tipe A
          Center(
            child: Column(
              children: [
                Container(
                  width: 348,
                  height: 170,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: const Color(0xFFD9D9D9),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Gambar
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => KosMawar(),
                              ),
                            );
                          },
                          child: Image.asset(
                            "images/bandaSakti.jpg",
                            width: 100,
                            height: 112,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),

                      Expanded(
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
                                    "Kost Rumah Mawar Tipe A",
                                    style: boldBlackText.copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.favorite,
                                  color: blackColor,
                                  size: 24,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Banda Sakti",
                              style: regularBlackText.copyWith(
                                fontSize: 11,
                                color: Colors.grey[700],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 2.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: const Text(
                                "Wanita",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "K.Mandi Dalam, Wifi, Dll.",
                              style: regularBlackText.copyWith(
                                fontSize: 11,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Harga : Rp 500.000/bulan",
                              style: boldBlackText.copyWith(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Todo Kost Rumah Mawar Tipe B
                const SizedBox(height: 25),
                Container(
                  width: 348,
                  height: 170,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: const Color(0xFFD9D9D9),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => KostMawarTipeb(),
                              ),
                            );
                          },
                          child: Image.asset(
                            "images/kostrumahmawarB.png",
                            width: 100,
                            height: 112,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
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
                                        builder: (context) => KostMawarTipeb(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Kost Rumah Mawar Tipe B",
                                    style: boldBlackText.copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.favorite,
                                  color: blackColor,
                                  size: 24,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Blang Pulo",
                              style: regularBlackText.copyWith(
                                fontSize: 11,
                                color: Colors.grey[700],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 2.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: const Text(
                                "Pria", // Jenis kelamin
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "K.Mandi Dalam, Wifi, Dll.",
                              style: regularBlackText.copyWith(
                                fontSize: 11,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Harga : Rp 400.000/bulan",
                              style: boldBlackText.copyWith(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
