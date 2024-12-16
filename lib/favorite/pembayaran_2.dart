import 'dart:async'; // Import for Timer
import 'package:flutter/material.dart';
import 'package:kostgo/favorite/favorite.dart';
import 'package:kostgo/favorite/pembayaran3.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kostgo/themes/colors_theme.dart';
import 'package:kostgo/themes/fonts_theme.dart';

class Pembayaran_2 extends StatefulWidget {
  const Pembayaran_2({super.key});

  @override
  _Pembayaran_2State createState() => _Pembayaran_2State();
}

class _Pembayaran_2State extends State<Pembayaran_2> {
  late int hours;
  late int minutes;
  late int seconds;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Initialize countdown timer (starting from 22:08:30)
    hours = 24;
    minutes = 00;
    seconds = 00;

    // Start the countdown timer
    _startTimer();
  }

  // Start the timer to count down
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else if (minutes > 0) {
          minutes--;
          seconds = 59;
        } else if (hours > 0) {
          hours--;
          minutes = 59;
          seconds = 59;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String getDayOfWeek(DateTime date) {
    List<String> daysOfWeek = [
      'Minggu', // Index 0
      'Senin', // Index 1
      'Selasa', // Index 2
      'Rabu', // Index 3
      'Kamis', // Index 4
      'Jumat', // Index 5
      'Sabtu' // Index 6
    ];

    return daysOfWeek[(date.weekday % 7)];
  }

  // Function to get formatted date (day, month, year)
  String getFormattedDate(DateTime date) {
    return "${date.day} ${getMonthName(date.month)} ${date.year}";
  }

  // Function to get formatted time (hours:minutes)
  String getFormattedTime(DateTime date) {
    return "${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}";
  }

  String getMonthName(int month) {
    List<String> months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember'
    ];
    return months[month - 1];
  }

  void _showCancellationConfirmation2Dialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 60,
              ),
              SizedBox(height: 10),
              Text(
                "Pembayaran anda berhasil dibatalkan",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Favorite(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: darkBlueColor,
              ),
              child: Text("Oke", style: regularWhiteText),
            ),
          ],
        );
      },
    );
  }

  void _showCancellationConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              SizedBox(height: 10),
              Text(
                "Yakin anda ingin membatalkan pembayaran?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog konfirmasi
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: darkBlueColor),
                ),
              ),
              child: Text(
                "Cancel",
                style: regularBlackText,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog pembatalan
                _showCancellationConfirmation2Dialog(
                    context); // Tampilkan dialog konfirmasi
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: darkBlueColor,
              ),
              child: Text("Yakin", style: regularWhiteText),
            ),
          ],
        );
      },
    );
  }

  void _showCancellationDialog(BuildContext context) {
    String? selectedReason;
    final TextEditingController reasonController = TextEditingController();

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    "Pilih alasan pembatalan ajukan sewa",
                    style: semiBoldBlackText.copyWith(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  RadioListTile(
                    title: const Text("Ingin mengubah rincian"),
                    value: "ubah_rincian",
                    groupValue: selectedReason,
                    onChanged: (value) {
                      setState(() {
                        selectedReason = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text("Berubah pikiran/lainnya"),
                    value: "berubah_pikiran",
                    groupValue: selectedReason,
                    onChanged: (value) {
                      setState(() {
                        selectedReason = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text("Mengubah alamat"),
                    value: "ubah_alamat",
                    groupValue: selectedReason,
                    onChanged: (value) {
                      setState(() {
                        selectedReason = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text("Alasan lainnya"),
                    value: "alasan_lainnya",
                    groupValue: selectedReason,
                    onChanged: (value) {
                      setState(() {
                        selectedReason = value.toString();
                      });
                    },
                  ),
                  if (selectedReason == "alasan_lainnya")
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(8),
                      height: 150, // Tinggi container ditingkatkan
                      decoration: BoxDecoration(
                        color: darkBlueColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: reasonController,
                        style: const TextStyle(color: Colors.white),
                        maxLines:
                            null, // Mengizinkan input teks lebih dari satu baris
                        decoration: const InputDecoration(
                          hintText: "Masukkan alasan anda",
                          hintStyle: TextStyle(color: Colors.white70),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Batal"),
                      ),
                      // Tambahkan ini di dalam `_showCancellationDialog` di bagian onPressed dari tombol "Konfirmasi":
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pop(); // Tutup dialog pembatalan
                          _showCancellationConfirmationDialog(
                              context); // Tampilkan dialog konfirmasi
                        },
                        child: const Text("Konfirmasi"),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error,
                color: Colors.red,
                size: 80, // Ukuran ikon yang besar
              ),
              SizedBox(height: 10),
              Text(
                "Yakin anda ingin membatalkan pembayaran?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                side: const BorderSide(color: darkBlueColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Logika untuk konfirmasi pembatalan
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Yakin"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get the date and time for tomorrow (1 day after today)
    DateTime tomorrow = DateTime.now().add(Duration(days: 1));

    return Scaffold(
      body: Stack(
        children: [
          // Background color
          Container(
            height: 360,
            width: double.infinity,
            color: darkBlueColor,
          ),
          // Top bar with back button and title
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
                    "Konfirmasi Pembayaran",
                    style: regularWhiteText.copyWith(fontSize: 16),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          // Payment status row
          Padding(
            padding: const EdgeInsets.only(top: 115, left: 100),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context); // Back to previous page
                  },
                  child: const Icon(
                    Icons.error,
                    color: whiteColor,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Menunggu Pembayaran",
                    style: regularWhiteText.copyWith(fontSize: 14),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          // Countdown Timer Container
          Padding(
            padding: const EdgeInsets.only(top: 180, left: 20),
            child: Container(
              width: 370,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.black,
                  width: 1.5,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Mohon Selesaikan Pembayaran Anda',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Jam dengan kotak hitam di belakangnya
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color:
                                    lightBlueColor0, // Warna latar belakang kotak
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                hours.toString().padLeft(2, '0'),
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange, // Warna teks
                                ),
                              ),
                            ),
                            const Text('Jam', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        // Menambahkan jarak antar angka dan titik dua
                        const SizedBox(width: 12),
                        // Titik dua
                        const Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Text(
                            ':',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Menit dengan kotak hitam di belakangnya
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color:
                                    lightBlueColor0, // Warna latar belakang kotak
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                minutes.toString().padLeft(2, '0'),
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange, // Warna teks
                                ),
                              ),
                            ),
                            const Text('Menit', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        const SizedBox(width: 12),
                        // Titik dua
                        const Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Text(
                            ':',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Detik dengan kotak hitam di belakangnya
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color:
                                    lightBlueColor0, // Warna latar belakang kotak
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                seconds.toString().padLeft(2, '0'),
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange, // Warna teks
                                ),
                              ),
                            ),
                            const Text('Detik', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Text(
                      'Sebelum ${getDayOfWeek(tomorrow)} ${getFormattedDate(tomorrow)}, ${getFormattedTime(tomorrow)} WIB',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 400, left: 42),
            child: Text(
              'Transfer ke nomor Virtual Account: ',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 425, left: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "images/bsi2.png",
                  width: 85,
                  height: 34,
                ),
                const SizedBox(
                  width: 40,
                ),
                const Text(
                  '721 8776620',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 465, left: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.file_copy,
                    color: Colors.lightBlue,
                    size: 30,
                  ),
                  onPressed: () {
                    // Copy the number to clipboard
                    Clipboard.setData(ClipboardData(text: '721 8776620'));

                    // Show a toast notification
                    Fluttertoast.showToast(
                      msg: "Nomor rekening disalin",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Salin nomor rekening',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.grey),
          const Padding(
            padding: EdgeInsets.only(top: 545, left: 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Jumlah yang harus dibayar"),
                SizedBox(width: 40),
                Text(
                  'Rp. 500.000',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.grey),
          Padding(
            padding: const EdgeInsets.only(top: 590, left: 40),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.file_copy,
                    color: Colors.lightBlue,
                    size: 30,
                  ),
                  onPressed: () {
                    // Copy the number to clipboard
                    Clipboard.setData(ClipboardData(text: 'Rp. 500.000'));

                    // Show a toast notification
                    Fluttertoast.showToast(
                      msg: "Berhasi disalin",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  },
                ),
                const SizedBox(width: 10),
                const Text(
                  'Salin jumlah pembayaran',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 665, left: 90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 223,
                  height: 46,
                  decoration: BoxDecoration(
                    color: darkBlueColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Pembayaran3(),
                        ),
                      );
                    },
                    child: Text(
                      "Bayar Sekarang",
                      style: semiBoldWhiteText.copyWith(
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 223,
                  child: OutlinedButton(
                    onPressed: () =>
                        _showCancellationDialog(context), // Show dialog
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      side: const BorderSide(
                        color: darkBlueColor,
                        width: 2,
                      ),
                    ),
                    child: const Text(
                      "Batalkan",
                      style: TextStyle(
                        color: darkBlueColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
