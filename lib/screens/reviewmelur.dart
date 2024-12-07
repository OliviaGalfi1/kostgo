import 'package:flutter/material.dart';
import 'package:kostgo/screens/melur.dart';
import 'package:kostgo/themes/colors_theme.dart';

class reviewmelur extends StatelessWidget {
  const reviewmelur({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: darkBlueColor,
            child: Stack(
              children: [
                Positioned(
                  top: 45,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Melur()),
                      );
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: whiteColor,
                      size: 30.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 110,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: mediumGreyColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "images/person.jpeg",
                        width: 35,
                        height: 34,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Tiaa",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "3 bulan yang lalu",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Row(
                        children: [
                          Icon(Icons.star, color: darkBlueColor, size: 16),
                          SizedBox(width: 4),
                          Text(
                            "5.0",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Kos nya nyaman dan bersih sesuai dengan gambar, pemilik kos juga baik serta lokasi kos nya sangat strategis.",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "lihat balasan pemilik",
                      style: TextStyle(
                        fontSize: 14,
                        color: darkBlueColor,
                        fontStyle: FontStyle.italic,
                      ),
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
