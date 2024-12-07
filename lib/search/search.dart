import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kostgo/favorite/favorite.dart';
import 'package:kostgo/profil/profilpage.dart';
import 'package:kostgo/screens/atlantik.dart';
import 'package:kostgo/screens/benhil.dart';
import 'package:kostgo/screens/home_screen.dart';
import 'package:kostgo/screens/kost_bravo.dart';
import 'package:kostgo/screens/kost_impian.dart';
import 'package:kostgo/screens/kost_mawar_TipeA.dart';
import 'package:kostgo/screens/melur.dart';
import 'package:kostgo/screens/pelangi.dart';
import 'package:kostgo/screens/tampilan.dart';
import 'package:kostgo/search/cari.dart';
import 'package:kostgo/search/filter.dart';
import 'package:kostgo/search/kost_global.dart';

import 'package:kostgo/themes/colors_theme.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: FilterDrawer(),
      backgroundColor: darkBlueColor,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          left: 32,
        ),
        child: Container(
          height: 59,
          width: 342,
          decoration: BoxDecoration(
            color: greyColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: const Icon(
                  Icons.home,
                  color: whiteColor,
                  size: 32,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.search,
                  color: darkBlueColor,
                  size: 32,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Favorite(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.favorite_border,
                  color: whiteColor,
                  size: 32,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Tampilan(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.message,
                  color: whiteColor,
                  size: 32,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilPage(),
                      ));
                },
                child: const Icon(
                  Icons.person,
                  color: whiteColor,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      ),
      //untuk scroll
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                "images/search2.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 42,
                left: 28,
                right: 28,
              ),
              child: SizedBox(
                height: 360.0,
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1,
                    aspectRatio: 16 / 9,
                    autoPlayInterval: Duration(seconds: 2),
                  ),
                  items: [
                    "images/iklan1.jpg",
                    "images/iklan2.jpg",
                    "images/iklan3.png",
                    "images/iklan4.jpg",
                    "images/iklan5.jpg"
                  ].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            margin: EdgeInsets.all(6),
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              i,
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
            // TODO  Pilihan kos ber ac
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 370,
                horizontal: 50,
              ),
              child: Container(
                width: 370,
                height: 35,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 6,
                  ),
                  child: Text(
                    "Pilihan kos ber AC buat kamu!",
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: blackColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 23,
            ),
            // TODO GAMBAR 1 BER AC
            Padding(
              padding: const EdgeInsets.only(
                top: 435,
                left: 26,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const KosMawar(),
                        ),
                      );
                    },
                    child: Image.asset(
                      "images/t.png",
                    ),
                  ),
                ],
              ),
            ),
            // TODO GAMBAR 2 BER AC
            Padding(
              padding: const EdgeInsets.only(
                top: 725,
                left: 26,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KostImpian(),
                        ),
                      );
                    },
                    child: Image.asset(
                      "images/list2.png",
                    ),
                  ),
                ],
              ),
            ),
            // TODO GAMBAR 3 BER AC
            Padding(
              padding: const EdgeInsets.only(
                top: 1005,
                left: 26,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Global(),
                        ),
                      );
                    },
                    child: Image.asset(
                      "images/list3.png",
                    ),
                  ),
                  SizedBox(
                    height: 350,
                  )
                ],
              ),
            ),
            // TODO GAMBAR 4 BER AC
            Padding(
              padding: const EdgeInsets.only(
                top: 1290,
                left: 26,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Benhil(),
                        ),
                      );
                    },
                    child: Image.asset(
                      "images/list4.png",
                    ),
                  ),
                  SizedBox(
                    height: 350,
                  )
                ],
              ),
            ),
            // TODO PILIHAN KOS TERBARU
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 1575,
                horizontal: 50,
              ),
              child: Container(
                width: 370,
                height: 35,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 6,
                  ),
                  child: Text(
                    "Pilihan kos terbaru buat kamu! ",
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: blackColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 23,
            ),
            // todo gambar kos bravo
            Padding(
              padding: const EdgeInsets.only(
                top: 1640,
                left: 26,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KostBravo(),
                        ),
                      );
                    },
                    child: Image.asset(
                      "images/kos1.png",
                    ),
                  ),
                ],
              ),
            ),
            // todo gambar kos atlantik
            Padding(
              padding: const EdgeInsets.only(
                top: 1935,
                left: 26,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Atlantik(),
                        ),
                      );
                    },
                    child: Image.asset(
                      "images/kos2.png",
                    ),
                  ),
                ],
              ),
            ),
            // todo gambar kos melur
            Padding(
              padding: const EdgeInsets.only(
                top: 2225,
                left: 26,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Melur(),
                        ),
                      );
                    },
                    child: Image.asset(
                      "images/kos3.png",
                    ),
                  ),
                  SizedBox(
                    height: 350,
                  )
                ],
              ),
            ),
            // todo gambar kos pelangi
            Padding(
              padding: const EdgeInsets.only(
                top: 2512,
                left: 26,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Pelangi(),
                        ),
                      );
                    },
                    child: Image.asset(
                      "images/kos4.png",
                    ),
                  ),
                  SizedBox(
                    height: 350,
                  )
                ],
              ),
            ),
            // todo pencarian
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 50,
                horizontal: 18,
              ),
              child: Container(
                height: 45,
                child: Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Cari(),
                            ),
                          );
                        },
                        child: TextField(
                          decoration: InputDecoration(
                            enabled: false,
                            filled: true,
                            fillColor: whiteColor,
                            prefixIcon: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Cari(),
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.search,
                                color: blackColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      flex: 1,
                      child: Builder(
                        builder: (context) => IconButton(
                          icon: const Icon(
                            Icons.tune_outlined,
                            color: blackColor,
                          ),
                          onPressed: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
