import 'package:flutter/material.dart';
import 'package:kostgo/themes/colors_theme.dart';
import 'package:kostgo/themes/fonts_theme.dart';

class Pencarian3 extends StatelessWidget {
  const Pencarian3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 85,
            width: 420,
            decoration: BoxDecoration(
              color: darkBlueColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 25,
                left: 9,
                right: 350,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: whiteColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 150,
              left: 160,
            ),
            child: Image.asset(
              "images/tidakada.png",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 85,
              right: 50,
            ),
            child: Text(
              "Belum Ada Kost Di Daerah Blang Mangat",
              style: regularBlackText.copyWith(
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
