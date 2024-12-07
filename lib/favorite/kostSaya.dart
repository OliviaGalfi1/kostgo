import 'package:flutter/material.dart';
import 'package:kostgo/favorite/favorite.dart';
import 'package:kostgo/screens/kost_bravo.dart';
import 'package:kostgo/screens/kost_mawar_TipeA.dart';
import 'package:kostgo/search/cari.dart';
import 'package:kostgo/search/kost_global.dart';
import 'package:kostgo/themes/colors_theme.dart';
import 'package:kostgo/themes/fonts_theme.dart';

class Kostsaya extends StatelessWidget {
  const Kostsaya({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 67,
              width: 420,
              decoration: BoxDecoration(color: darkBlueColor),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 9, left: 0, bottom: 9, right: 320),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Favorite()));
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 6,
              width: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kost Saya",
                    style: boldBlackText.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "Kamu Belum Menyewa Kos",
                    style: boldBlackText.copyWith(
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Yuk, sewa di KostGo atau silahkan masukkan kode\n dari pemilik kost untuk aktifkan halaman ini! Coba cara\n cari kost modern dengan manfaat berikut ini.",
                    style: regularBlackText.copyWith(fontSize: 12),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.library_books_outlined,
                        color: blackColor,
                        size: 32,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Tagihan dan kontak sewa tercatat rapi",
                        style: extraLightBlackText.copyWith(fontSize: 13),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.paid_outlined,
                        color: blackColor,
                        size: 32,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "KostGo menjaga keamanan transaksi anda",
                        style: extraLightBlackText.copyWith(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.local_atm_outlined,
                        color: blackColor,
                        size: 32,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Cashless dengan beragam metode pembayaran",
                        style: extraLightBlackText.copyWith(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Container(
                      width: double.infinity,
                      height: 37,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFF022B60),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Cari()),
                          );
                        },
                        child: Text(
                          "Mulai Cari dan Sewa Kos",
                          style: regularWhiteText.copyWith(
                              fontSize: 12, color: whiteColor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 11),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 150,
                    ),
                    child: Text(
                      "Rekomendasi buat kamu",
                      style: boldBlackText.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 400,
                    child: ListView(
                      children: [
                        // Kost Mawar
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KosMawar()),
                            );
                          },
                          child: _buildKostRecommendation(
                            imagePath: "images/bandasaktii.png",
                            namaKost: "Kost Mawar",
                            detailPenghuni: "Only Girl",
                            alamat: "Kost Banda Sakti Tipe A Lhokseumawe",
                            kecamatan: "Kecamatan Muara 1",
                            fasilitas: "K.Mandi Dalam.WIFI.AC....",
                            price: "Rp. 600,000/bulan",
                          ),
                        ),
                        // Kost Bravo
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KostBravo()),
                            );
                          },
                          child: _buildKostRecommendation(
                            imagePath: "images/bravo.png",
                            namaKost: "Kost Bravo",
                            detailPenghuni: "Only Girl",
                            alamat: "Kost Muara 1 Tipe B Lhokseumawe",
                            kecamatan: "Kecamatan Muara 1",
                            fasilitas:
                                "K.Mandi Dalam.WIFI.Kipas Angin.Tempat Tidur..",
                            price: "Rp. 680,000/bulan",
                          ),
                        ),
                        // Kost Global
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Global()),
                            );
                          },
                          child: _buildKostRecommendation(
                            imagePath: "images/muaraa1.png",
                            namaKost: "Kost Global",
                            detailPenghuni: "Only Girl",
                            alamat: "Kost Muara Satu Tipe B Lhokseumawe",
                            kecamatan: "Kecamatan Muara 1",
                            fasilitas: "K.Mandi Dalam.WIFI.Kipas Angin....",
                            price: "Rp. 700,000/bulan",
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKostRecommendation({
    required String imagePath,
    required String namaKost,
    required String detailPenghuni,
    required String alamat,
    required String kecamatan,
    required String fasilitas,
    required String price,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 112,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        namaKost,
                        style: boldBlackText.copyWith(fontSize: 14),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        detailPenghuni,
                        style: regularBlackText.copyWith(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  alamat,
                  style: regularBlackText.copyWith(fontSize: 9),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 16,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        kecamatan,
                        style: regularBlackText.copyWith(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  fasilitas,
                  style: regularBlackText.copyWith(fontSize: 9),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 100,
                  ),
                  child: Text(
                    price,
                    style: boldBlackText.copyWith(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
