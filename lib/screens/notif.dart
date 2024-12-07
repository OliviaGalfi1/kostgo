import 'package:flutter/material.dart';
import 'package:kostgo/themes/colors_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Notif(),
    );
  }
}

class Notif extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      "title": "Kost terbaru!!!!!",
      "description": "Kost Mawar, letak strategis di Muara Satu",
      "image": "images/muaraa1.png",
    },
    {
      "title": "Kost Benhil Kamar 1 Promo!!!!",
      "description": "hanya dp Rp.500.000 mulai tanggal 1 Juni",
      "image": "images/benhil.png",
    },
    {
      "title": "Kost impian hanya di Kost Atlantik",
      "description": "Pesan sekarang di sini",
      "image": "images/impian.png",
    },
    {
      "title": "Ada yang baru nih!!!!!",
      "description": "Terbaru di Muara Dua, Kost Melur",
      "image": "images/melur.png",
    },
    {
      "title": "Ada yang baru nih!!!!!",
      "description": "Terbaru di Muara Dua, Kost Melur",
      "image": "images/melur.png",
    },
    {
      "title": "Kost Benhil Kamar 1 Promo!!!!",
      "description": "hanya dp Rp.500.000 mulai tanggal 1 Juni",
      "image": "images/benhil.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlueColor, // Sesuai warna desain
        title: Text(
          "Notifikasi",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white, // Warna biru untuk ikon
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: notifications.map((notif) {
              return NotificationItem(
                title: notif['title']!,
                description: notif['description']!,
                image: notif['image']!,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const NotificationItem({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
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
