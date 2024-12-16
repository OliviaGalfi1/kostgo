import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kostgo/profil/riwayatransaksi.dart';
import 'package:kostgo/screens/kost_mawar_TipeA.dart';
import 'package:kostgo/themes/colors_theme.dart';
import 'package:kostgo/themes/fonts_theme.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Pembayaran3 extends StatefulWidget {
  const Pembayaran3({super.key});

  @override
  State<Pembayaran3> createState() => _Pembayaran3State();
}

void _showPembayaranDialogDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 60,
            ),
            SizedBox(height: 10),
            Text(
              "Pembayaran kamu berhasil silahkan cek Kostmu!",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => rTransaksi(),
                ),
              );
            },
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: darkBlueColor),
              ),
            ),
            child: Text(
              "Riwayat",
              style: regularBlackText,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const KosMawar(),
                ),
              ); // Tutup dialog pembatalan
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: darkBlueColor,
            ),
            child: Text("Kembali", style: regularWhiteText),
          ),
        ],
      );
    },
  );
}

class _Pembayaran3State extends State<Pembayaran3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          Container(
            height: 85,
            width: double.infinity,
            color: darkBlueColor,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35, left: 7, right: 15),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context); // Back to previous page
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: whiteColor,
                    size: 40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Pembayaran",
                    style: regularWhiteText.copyWith(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 85),
            child: Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Warna bayangan
                    blurRadius: 10, // Radius blur bayangan
                    offset: const Offset(
                        4, 4), // Posisi bayangan (horizontal, vertical)
                    spreadRadius: 2, // Mengatur penyebaran bayangan
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 95, left: 20, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Pembayaran",
                    style: regular1BlackText.copyWith(fontSize: 15)),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Rp. 500.000",
                    style: boldBlackText.copyWith(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150, left: 20, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "images/bsi2.png",
                  width: 78,
                  height: 36,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Bank Syariah Indonesia (BSI) (Dicek Otomatis)",
                    style: regular1BlackText.copyWith(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 210,
            ),
            child: Container(
                height: 2, // Ketebalan garis
                color: lightGreyColor // Warna garis abu-abu
                ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 230, left: 110, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "No. Rekening :",
                  style: semiBoldBlackText.copyWith(fontSize: 15),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "721 8776620",
                      style: boldYellowText.copyWith(fontSize: 15),
                    ),
                    SizedBox(width: 130),
                    GestureDetector(
                      onTap: () {
                        // Copy the number to clipboard
                        Clipboard.setData(ClipboardData(text: '721 8776620'));

                        // Show a toast notification
                        Fluttertoast.showToast(
                          msg: "Berhasil disalin",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                      child: Text(
                        "SALIN",
                        style: regularGreyText.copyWith(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 305,
            ),
            child: Container(
              height: 2, // Ketebalan garis
              color: lightGreyColor, // Warna garis abu-abu
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 323, left: 110, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dicek dalam 15 menit setelah pembayaran berhasil",
                  style: regularYelllowText.copyWith(fontSize: 13),
                ),
                const SizedBox(height: 10),
                Text(
                  "Bayar sewa kost ke Virtual Account agar nomor tetap sama",
                  style: regularBlueText.copyWith(fontSize: 13),
                ),
                const SizedBox(height: 10),
                Text(
                  "Hanya menerima dari Bank Syariah Indonesia",
                  style: regularBlueText.copyWith(fontSize: 13),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 470,
            ),
            child: Container(
              height: 4, // Ketebalan garis
              color: lightGreyColor, // Warna garis abu-abu
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 490,
              left: 25,
            ),
            child: Text(
              "Petunjuk Transfer mBanking",
              style: semiBoldBlackText.copyWith(
                fontSize: 13,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 525,
            ),
            child: Container(
              height: 2, // Ketebalan garis
              color: lightGreyColor, // Warna garis abu-abu
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 550,
              left: 30,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 25, // Lebar lingkaran
                      height: 25, // Tinggi lingkaran
                      decoration: const BoxDecoration(
                        color: darkBlueColor, // Warna lingkaran
                        shape: BoxShape.circle, // Bentuk lingkaran
                      ),
                      child: const Center(
                        child: Text(
                          "1",
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 16, // Ukuran font
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 25, // Lebar lingkaran
                      height: 25, // Tinggi lingkaran
                      decoration: const BoxDecoration(
                        color: darkBlueColor, // Warna lingkaran
                        shape: BoxShape.circle, // Bentuk lingkaran
                      ),
                      child: const Center(
                        child: Text(
                          "2",
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 16, // Ukuran font
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 25, // Lebar lingkaran
                      height: 25, // Tinggi lingkaran
                      decoration: const BoxDecoration(
                        color: darkBlueColor, // Warna lingkaran
                        shape: BoxShape.circle, // Bentuk lingkaran
                      ),
                      child: const Center(
                        child: Text(
                          "3",
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 16, // Ukuran font
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 25, // Lebar lingkaran
                      height: 25, // Tinggi lingkaran
                      decoration: const BoxDecoration(
                        color: darkBlueColor, // Warna lingkaran
                        shape: BoxShape.circle, // Bentuk lingkaran
                      ),
                      child: const Center(
                        child: Text(
                          "4",
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 16, // Ukuran font
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 25, // Lebar lingkaran
                      height: 25, // Tinggi lingkaran
                      decoration: const BoxDecoration(
                        color: darkBlueColor, // Warna lingkaran
                        shape: BoxShape.circle, // Bentuk lingkaran
                      ),
                      child: const Center(
                        child: Text(
                          "5",
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 16, // Ukuran font
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 550, left: 70, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pilih Pembayaran",
                  style: regularBlueText.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 15),
                Text(
                  "Pilih Kost Digital KosGo!",
                  style: regularBlueText.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 15),
                Text(
                  "Pilih nomor rekening yang akan kamu gunakan.",
                  style: regularBlueText.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 15),
                Text(
                  "Masukkan nomor Virtual Account",
                  style: regularBlueText.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 15),
                Text(
                  "Masukkan PIN Anda dan klik Selanjutnya",
                  style: regularBlueText.copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 740, left: 95),
            child: SizedBox(
              width: 223,
              height: 60,
              child: OutlinedButton(
                onPressed: () {
                  // Menampilkan notifikasi pembayaran berhasil
                  Fluttertoast.showToast(
                    msg: "Pembayaran berhasil!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );

                  // Menampilkan dialog pembayaran berhasil
                  _showPembayaranDialogDialog(context);
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: darkBlueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "Oke",
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
