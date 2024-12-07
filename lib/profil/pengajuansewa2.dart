import 'package:flutter/material.dart';
import 'package:kostgo/themes/colors_theme.dart';
import 'package:kostgo/themes/fonts_theme.dart';

class rsewa2 extends StatelessWidget {
  const rsewa2({super.key});

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
            padding: EdgeInsets.only(top: 340, left: 110),
            child: Image.asset(
              "images/rsewa.png",
              width: 200,
              height: 200,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 300,
              left: 100,
              right: 100,
            ),
            child: Center(
              child: Text(
                "Kamu belum punya transaksi pada kategori ini",
                textAlign: TextAlign.center,
                style: regularBlackText.copyWith(fontSize: 16),
                overflow: TextOverflow.visible,
                maxLines: null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
