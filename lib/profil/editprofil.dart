import 'package:flutter/material.dart';
import 'package:kostgo/profil/profilpage.dart';
import 'package:kostgo/themes/colors_theme.dart';
import 'package:kostgo/themes/fonts_theme.dart';

class Editprofil extends StatefulWidget {
  const Editprofil({super.key});

  @override
  State<Editprofil> createState() => _EditprofilState();
}

class _EditprofilState extends State<Editprofil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35, left: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context); // Back to previous page
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: blackColor,
                      size: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Ubah Profil",
                      style: regularBlackText.copyWith(fontSize: 16),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilPage(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.check,
                      color: blackColor,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nama",
                    style: regularBlackText.copyWith(
                      fontSize: 15,
                      color: blackColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: whiteColor,
                      hintText: "Masukkan Nama Anda",
                      hintStyle: regularBlackText.copyWith(
                        color: Color(0xFFC9C9C9),
                        fontSize: 14,
                      ),
                      prefixIcon: Image.asset(
                        "images/nama.png",
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: darkBlueColor, // Set the stroke color
                          width: 1.5, // Set the stroke width
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: darkBlueColor,
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: greyColor, // Different color when focused
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 270, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Gender",
                    style: regularBlackText.copyWith(
                      fontSize: 15,
                      color: blackColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: "Masukkan Gender",
                      hintStyle: regularBlackText.copyWith(
                        color: Color(0xFFC9C9C9),
                        fontSize: 14,
                      ),
                      prefixIcon: Image.asset(
                        "images/nama.png",
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: darkBlueColor, // Set the stroke color
                          width: 1.5, // Set the stroke width
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: darkBlueColor,
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: greyColor, // Different color when focused
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 390, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: regularBlackText.copyWith(
                      fontSize: 15,
                      color: blackColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: "Masukkan Email",
                      hintStyle: regularBlackText.copyWith(
                        color: Color(0xFFC9C9C9),
                        fontSize: 14,
                      ),
                      prefixIcon: Image.asset(
                        "images/username.png",
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: darkBlueColor, // Set the stroke color
                          width: 1.5, // Set the stroke width
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: darkBlueColor,
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: greyColor, // Different color when focused
                          width: 1.5,
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
    );
  }
}
