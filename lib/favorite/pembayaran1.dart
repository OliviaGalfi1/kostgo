import 'package:flutter/material.dart';
import 'package:kostgo/favorite/pembayaran_2.dart';
import 'package:kostgo/themes/colors_theme.dart';
import 'package:kostgo/themes/fonts_theme.dart';

class Pembayaran1 extends StatefulWidget {
  const Pembayaran1({Key? key}) : super(key: key);

  @override
  _Pembayaran1State createState() => _Pembayaran1State();
}

class _Pembayaran1State extends State<Pembayaran1> {
  String? selectedBank;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            width: double.infinity,
            height: 90,
            color: darkBlueColor,
            padding: const EdgeInsets.only(top: 35, left: 7, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  "Metode Pembayaran",
                  style: semiBoldWhiteText.copyWith(fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Konten utama
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pilih Pembayaran",
                  style: boldBlackText.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  "Virtual Account",
                  style: regularBlackText.copyWith(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Daftar Bank
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                bankOption("Bank Syariah Indonesia", "images/bsi.png"),
                bankOption("Bank Aceh", "images/bankAceh.png"),
                bankOption("Bank BCA", "images/bca.png"),
                bankOption("Bank Mandiri", "images/mandiri.png"),
                bankOption("Bank BNI", "images/bni.png"),
                bankOption("Bank BRI", "images/bri.png"),
                bankOption("Dana", "images/dana.png"),
              ],
            ),
          ),
          // Biaya Sewa
          Padding(
            padding: const EdgeInsets.only(left: 150),
            child: Text(
              "Biaya Sewa Kost : Rp 500.000,00",
              style: semiBoldBlackText.copyWith(fontSize: 15),
            ),
          ),
          const Divider(color: Colors.grey), // Divider below Pengajuan Sewa
          // Tombol Konfirmasi
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 100),
            child: Container(
              width: 223,
              height: 46,
              decoration: BoxDecoration(
                color: (selectedBank == "Bank Syariah Indonesia")
                    ? darkBlueColor
                    : Colors
                        .grey, // abu-abu jika bank selain BSI atau BNI dipilih
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextButton(
                onPressed: (selectedBank == "Bank Syariah Indonesia")
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Pembayaran_2(),
                          ),
                        );
                      }
                    : null, // tidak bisa ditekan jika bank selain BSI atau BNI dipilih
                child: Text(
                  "Konfirmasi",
                  style: semiBoldWhiteText.copyWith(
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk pilihan bank
  Widget bankOption(String bankName, String assetPath) {
    return ListTile(
      leading: Radio<String>(
        value: bankName,
        groupValue: selectedBank,
        onChanged: (value) {
          setState(() {
            selectedBank = value;
          });
        },
        activeColor: darkBlueColor,
      ),
      title: Row(
        children: [
          Image.asset(
            assetPath,
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 10),
          Text(
            bankName,
            style: regularBlackText.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
