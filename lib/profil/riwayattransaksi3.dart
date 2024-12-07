import 'package:flutter/material.dart';
import 'package:kostgo/themes/colors_theme.dart';
import 'package:kostgo/themes/fonts_theme.dart';

class rtransaksi3 extends StatelessWidget {
  const rtransaksi3({super.key});

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
            padding: EdgeInsets.only(top: 340, left: 60),
            child: Image.asset(
              "image/rtransaksi.png",
              width: 274,
              height: 174,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 200,
              left: 30,
              right: 30,
            ),
            child: Center(
              child: Text(
                "Belum Ada Transaksi",
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
