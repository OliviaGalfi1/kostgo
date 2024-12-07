import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kostgo/chat/chatPage1.dart';
import 'package:kostgo/favorite/favorite.dart';
import 'package:kostgo/login.dart';
import 'package:kostgo/profil/editprofil.dart';
import 'package:kostgo/profil/pengajuansewa.dart';
import 'package:kostgo/profil/pusatbantuan.dart';
import 'package:kostgo/profil/riwayatkos.dart';
import 'package:kostgo/profil/riwayatransaksi.dart';
import 'package:kostgo/screens/home_screen.dart';
import 'package:kostgo/search/search.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kostgo/themes/colors_theme.dart';
import 'package:kostgo/themes/fonts_theme.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _profilpageState();
}

class _profilpageState extends State<ProfilPage> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                },
                child: const Icon(
                  Icons.home,
                  color: whiteColor, // Replace darkBlueColor with Colors.blue
                  size: 32,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchPage(),
                      ));
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
                      builder: (context) => const Favorite(),
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
                      builder: (context) =>
                          ChatPage(), // Define or import Favorit class
                    ),
                  );
                },
                child: const Icon(
                  Icons.message,
                  color: whiteColor,
                  size: 32,
                ),
              ),
              const Icon(
                Icons.person,
                color: darkBlueColor, // Replace darkBlueColor with Colors.blue
                size: 32,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 50,
          left: 11,
          right: 11,
        ),
        child: Column(
          children: [
            Container(
              height: 145,
              width: double.infinity,
              decoration: BoxDecoration(
                color: darkBlueColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15), // Padding on left and right
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: _pickImage, // Function to pick an image
                      child: Container(
                        width: 100, // Width for the profile image
                        height: 100,
                        decoration: BoxDecoration(
                          color: darkBlueColor,
                          shape: BoxShape
                              .circle, // Circular shape for the profile image
                        ),
                        child: ClipOval(
                          child: _imageFile != null
                              ? Image.file(
                                  _imageFile!,
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                )
                              : Image.asset(
                                  "images/profil.png", // Default profile image
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                        width: 15), // Space between the image and text
                    Expanded(
                      child: Text(
                        "olivia", // User name or display name
                        style: semiBoldWhiteText.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 10), // Padding for the edit icon
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Editprofil(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.edit,
                          color: whiteColor,
                          size: 32,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 39,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const pSewa(),
                  ),
                );
              },
              child: Container(
                height: 52,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: darkBlueColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.only(
                  right: 100,
                  left: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.house,
                        color: whiteColor,
                        size: 42,
                      ),
                    ),
                    Text(
                      "Riwayat pengajuan sewa",
                      style: regularWhiteText.copyWith(
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const rKost(),
                  ),
                );
              },
              child: Container(
                height: 52,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: darkBlueColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.only(
                  right: 100,
                  left: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: const Icon(
                        Icons.edit_note,
                        color: whiteColor,
                        size: 42,
                      ),
                    ),
                    Text(
                      "Riwayat kos terdahulu",
                      style: regularWhiteText.copyWith(
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const rTransaksi(),
                    ));
              },
              child: Container(
                height: 52,
                width: 400,
                decoration: BoxDecoration(
                  color: darkBlueColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.only(
                  right: 100,
                  left: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: const Icon(
                        Icons.receipt_long,
                        color: whiteColor,
                        size: 42,
                      ),
                    ),
                    Text(
                      "Riwayat transaksi",
                      style: regularWhiteText.copyWith(
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const pBantuan(),
                    ));
              },
              child: Container(
                height: 52,
                width: 400,
                decoration: BoxDecoration(
                  color: darkBlueColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.only(
                  right: 100,
                  left: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: const Icon(
                        Icons.description,
                        color: whiteColor,
                        size: 42,
                      ),
                    ),
                    Text(
                      "Syarat dan ketentuan",
                      style: regularWhiteText.copyWith(
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 49,
            ),
            const SizedBox(height: 39),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      title: const Icon(
                        Icons.logout,
                        size: 48,
                        color: darkBlueColor,
                      ),
                      content: Text(
                        "Yakin anda ingin keluar?",
                        style: semiBoldBlackText.copyWith(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Cancel",
                            style: regularBlueText.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: darkBlueColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Ya",
                            style: regularWhiteText.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                height: 52,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: darkBlueColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.logout,
                        color: whiteColor,
                        size: 32,
                      ),
                    ),
                    Text(
                      "Logout Akun",
                      style: regularWhiteText.copyWith(
                        fontSize: 14,
                      ),
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
