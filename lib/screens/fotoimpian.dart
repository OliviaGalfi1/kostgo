import 'package:flutter/material.dart';
import 'package:kostgo/themes/colors_theme.dart';

class Fotoimpian extends StatelessWidget {
  const Fotoimpian({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar gambar sebagai contoh
    final List<String> images = [
      'images/aa.png',
      'images/bb.png',
      'images/cc.png',
      'images/dd.png',
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlueColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        color: darkBlueColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    images[index],
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
