import 'package:flutter/material.dart';
import 'package:kostgo/chat/chatPage1.dart';
import 'package:kostgo/favorite/favorite.dart';
import 'package:kostgo/profil/profilpage.dart';
import 'package:kostgo/screens/atlantik.dart';
import 'package:kostgo/screens/bandasakti.dart';
import 'package:kostgo/screens/benhil.dart';
import 'package:kostgo/screens/kost_impian.dart';
import 'package:kostgo/screens/kost_mawar_TipeA.dart';
import 'package:kostgo/screens/muaradua.dart';
import 'package:kostgo/screens/muarasatu.dart';
import 'package:kostgo/screens/notif.dart';
import 'package:kostgo/search/cari.dart';

import 'package:kostgo/search/kost_global.dart';
import 'package:kostgo/search/pencarian3.dart';
import 'package:kostgo/search/search.dart';
import 'package:kostgo/themes/colors_theme.dart';
import 'package:kostgo/themes/fonts_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      resizeToAvoidBottomInset: false,
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
              const Icon(
                Icons.home,
                color: darkBlueColor,
                size: 32,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchPage(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.search,
                  color: whiteColor,
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
                      builder: (context) => ChatPage(),
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
            //container untuk teks kostgo dan temukan kost inpianmu
            Container(
              height: 145,
              width: double.infinity,
              color: darkBlueColor,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 125,
                left: 12,
                right: 12,
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 19,
                ),
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: darkBlueColor,
                  border: Border.all(
                    color: whiteColor,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // menggunakan cross axis karena susunan teks nya secara horizontal,
                  children: [
                    Text(
                      "#KosGo",
                      style: blackWhiteText.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Temukan kost impianmu!",
                      style: thinWhiteText.copyWith(
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 220,
                left: 7,
                right: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Subdistrict",
                    style: regularBlackText.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 250,
              ),
              child: Container(
                height: 158,
                width: double.infinity,
                color: darkBlueColor,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal, //scroll kesamping
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 97,
                          height: 115,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Muarasatu(),
                                      ),
                                    );
                                  },
                                  child: Image.asset(
                                    "images/muaraa1.png", //Gambar untuk Muara Satu
                                    width: 97,
                                    height: 95,
                                    // fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                width: 97,
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: lightGreyColor,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                ),
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Muarasatu(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Muara Satu", // Teks Muara Satu
                                      style: semiBoldBlackText.copyWith(
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        SizedBox(
                          width: 97,
                          height: 115,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => bandasakti(),
                                      ),
                                    );
                                  },
                                  child: Image.asset(
                                    "images/bandasaktii.png", //Gambar Banda Sakti
                                    width: 97,
                                    height: 95,
                                    // fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                width: 97,
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: lightGreyColor,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                ),
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => bandasakti(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Banda Sakti", //Teks Banda Sakti
                                      style: semiBoldBlackText.copyWith(
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        SizedBox(
                          width: 97,
                          height: 115,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Muaradua(),
                                      ),
                                    );
                                  },
                                  child: Image.asset(
                                    "images/muara2.png",
                                    width: 97,
                                    height: 95,
                                    // fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                width: 97,
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: lightGreyColor,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                ),
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Muaradua(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Muara Dua",
                                      style: semiBoldBlackText.copyWith(
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          height: 115,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Pencarian3(),
                                      ),
                                    );
                                  },
                                  child: Image.asset(
                                    "images/blangmangat.png", //Gambar Blang Mangat
                                    width: 97,
                                    height: 95,
                                    // fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                width: 97,
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: lightGreyColor,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Blang Mangat", //Teks Blang Mangat
                                    style: semiBoldBlackText.copyWith(
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 430, left: 7, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended Kost",
                    style: regularBlackText.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            // TODO: Gambar Kost Global
            Padding(
              padding: const EdgeInsets.only(
                top: 474,
                left: 25,
                right: 28,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(11),
                    child: SizedBox(
                      width: 150,
                      height: 113,
                      child: Stack(
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
                              "images/muara1.jpg",
                              width: 150,
                              height: 113,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Image.asset(
                              "images/rate.png",
                              height: 34,
                              width: 70,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24,
                    ),
                    child: Column(
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
                          child: Text(
                            "Global Raya",
                            style: boldBlackText.copyWith(
                              fontSize: 13,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "500k",
                                style: extraLightYellowText.copyWith(
                                  fontSize: 13,
                                ),
                              ),
                              TextSpan(
                                text: "/ month",
                                style: extraLightBlackText.copyWith(
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 23,
                        ),
                        Text(
                          "Bukit Indah, Lhokseumawe",
                          style: thinGreyText.copyWith(
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // TODO: Gambar kost Atlantik
            Padding(
              padding: const EdgeInsets.only(top: 620, left: 25, right: 28),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(11),
                    child: SizedBox(
                      width: 150,
                      height: 113,
                      child: Stack(
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
                              "images/atlantik.png",
                              width: 150,
                              height: 113,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Image.asset(
                              "images/rate.png", // Ensure this image exists
                              height: 34,
                              width: 70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Column(
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
                          child: Text(
                            "Atlantik",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 3),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "500k",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.yellow),
                              ),
                              TextSpan(
                                text: " / month",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 23),
                        Text(
                          "Muara Dua, Lhokseumawe",
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Second Property Card: Mawar
            Padding(
              padding: const EdgeInsets.only(top: 770, left: 25, right: 28),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(11),
                    child: SizedBox(
                      width: 150,
                      height: 113,
                      child: Stack(
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
                            child: Image.asset(
                              "images/bandaSakti.jpg",
                              width: 150,
                              height: 113,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Image.asset(
                              "images/rate.png", // Ensure this image exists
                              height: 34,
                              width: 70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            "Mawar",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 3),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "500k",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.yellow),
                              ),
                              TextSpan(
                                text: " / month",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 23),
                        Text(
                          "Banda Sakti, Lhokseumawe",
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Third Property Card: Impian
            Padding(
              padding: const EdgeInsets.only(top: 920, left: 25, right: 28),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(11),
                    child: SizedBox(
                      width: 150,
                      height: 113,
                      child: Stack(
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
                              "images/impian.png",
                              width: 150,
                              height: 113,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Image.asset(
                              "images/rate.png", // Ensure this image exists
                              height: 34,
                              width: 70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Column(
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
                          child: Text(
                            "Impian",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 3),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "500k",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.yellow),
                              ),
                              TextSpan(
                                text: " / month",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 23),
                        Text(
                          "Muara Dua, Lhokseumawe",
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Fourth Property Card: Benhil
            Padding(
              padding: const EdgeInsets.only(top: 1075, left: 25, right: 28),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(11),
                    child: SizedBox(
                      width: 150,
                      height: 113,
                      child: Stack(
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
                              "images/benhil.png",
                              width: 150,
                              height: 113,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Image.asset(
                              "images/rate.png", // Ensure this image exists
                              height: 34,
                              width: 70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Column(
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
                          child: Text(
                            "Benhil",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 3),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "500k",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.yellow),
                              ),
                              TextSpan(
                                text: " / month",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 23),
                        Text(
                          "Muara Satu, Lhokseumawe",
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Search and Notification Section
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Cari(), // Ganti dengan widget tujuan Anda
                          ),
                        );
                      },
                      child: TextField(
                        enabled:
                            false, // Menonaktifkan input agar TextField hanya berfungsi sebagai tombol
                        decoration: InputDecoration(
                          filled:
                              true, // Menjadikan latar belakang TextField berwarna
                          fillColor: Colors.white, // Warna latar belakang putih
                          hintText: 'Cari kost',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide.none, // Hilangkan garis tepi default
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: Icon(
                      Icons.notifications,
                      color: whiteColor,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Notif(), // Ganti dengan widget tujuan Anda
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
