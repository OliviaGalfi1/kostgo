import 'package:flutter/material.dart';
import 'package:kostgo/themes/colors_theme.dart';

class Pencarian extends StatefulWidget {
  const Pencarian({super.key});

  @override
  _PencarianState createState() => _PencarianState();
}

class _PencarianState extends State<Pencarian> {
  final List<String> imagePaths = [
    'images/pencarian1.png',
    'images/pencarian2.png',
    'images/pencarian3.png',
    'images/pencarian4.png',
  ];

  final List<String> kostImages = [
    'images/muara1.jpg',
    'images/pencarian3.png',
    'images/pencarian4.png',
    'images/pencarian1.png',
    'images/pencarian1.png',
    'images/pencarian1.png',
    'images/pencarian1.png',
  ];

  List<String> kostItems = [
    "Kost pria area blang pulo",
    "Kost wanita ber Ac",
    "Kost pria tahunan",
    "Kost pria tahunan",
    "Kost Wanita bulanan",
    "Kost Wanita bulanan",
    "Kost Wanita",
  ];

  bool showMore = false;

  void toggleShowMore() {
    setState(() {
      showMore = !showMore;
    });
  }

  void clearSearchHistory() {
    setState(() {
      kostItems.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final displayedItems = showMore ? kostItems : kostItems.take(4).toList();
    final displayedImages = showMore ? kostImages : kostImages.take(4).toList();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: darkBlueColor,
            size: 30,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child: Container(
            height: 45,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: darkBlueColor,
                  size: 25,
                ),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: darkBlueColor, width: 2.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: darkBlueColor, width: 2.0),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: darkBlueColor,
            ),
            onPressed: clearSearchHistory,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                if (kostItems.isNotEmpty) ...[
                  for (int i = 0; i < displayedItems.length; i++)
                    ListTile(
                      title: InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(displayedItems[i]),
                            const SizedBox(width: 15),
                            Image.asset(
                              displayedImages[i],
                              width: 40,
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                ] else
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Riwayat pencarian kosong",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                if (kostItems.length > 4)
                  Center(
                    child: TextButton(
                      onPressed: toggleShowMore,
                      child: Text(
                        showMore ? "Sembunyikan" : "Lihat lainnya",
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                  ),
              ],
            ),
            // GridView.builder untuk "Pencarian Pilihan"
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.0,
              ),
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(8)),
                          child: Image.asset(
                            imagePaths[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          index % 2 == 0 ? "Kost wanita" : "Kost pria",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
