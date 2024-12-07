import 'package:flutter/material.dart';
import 'package:kostgo/themes/colors_theme.dart';
import 'package:kostgo/themes/fonts_theme.dart';

class pBantuan extends StatelessWidget {
  const pBantuan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlueColor0,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: whiteColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey
                      .withOpacity(0.5), // Warna dan transparansi bayangan
                  spreadRadius: 5, // Menyebarkan bayangan
                  blurRadius: 7, // Radius blur untuk bayangan
                  offset: Offset(0, 3), // Mengatur posisi (x, y) bayangan
                ),
              ],
            ),
            padding: const EdgeInsets.only(top: 25, left: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "images/logo.png",
                      width: 70,
                      height: 70,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Pusat Bantuan",
                      style: semiBoldBlueText.copyWith(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120, left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Halo, terima kasih telah mengunjungi aplikasi KostGo.",
                  style: regularBlackText.copyWith(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                Text(
                  "Platform ini dimiliki dan dioperasikan oleh KostGo dan afiliasinya "
                  "(selanjutnya disebut, “Kami”). Kami sangat menghormati privasi "
                  "atas Data Pribadi pendatang, pengguna, ataupun pengguna terdaftar "
                  "(selanjutnya disebut “Anda”) dan ingin melindungi Data Pribadi tersebut "
                  "sesuai dengan Kebijakan Privasi (selanjutnya disebut “Kebijakan”) ini.",
                  style: regularBlackText.copyWith(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                Text(
                  "Kebijakan ini berlaku pada setiap platform yang dioperasikan oleh Kami. Kebijakan ini menjelaskan bagaimana Kami mengumpulkan, menyimpan, menjaga, menggunakan, dan (pada kondisi tertentu) mengungkapkan Data Pribadi yang teridentifikasi yang Anda berikan selama menggunakan platform Kami (selanjutnya disebut “Data Pribadi”) serta menjelaskan bagaimana langkah yang telah Kami ambil untuk mengamankan Data Pribadi Anda. Dengan menyetujui Kebijakan ini, maka Anda dianggap telah membaca, mengerti, memahami, dan menyetujui seluruh isi yang tertuang dalam Kebijakan ini. Apabila Anda tidak setuju dengan sebagian atau seluruh isi Kebijakan ini, Anda dapat meninggalkan platform yang Kami kelola.",
                  style: regularBlackText.copyWith(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
