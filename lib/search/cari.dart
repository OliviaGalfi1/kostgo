import 'package:flutter/material.dart';
import 'package:kostgo/search/pencarian1.dart';
import 'package:kostgo/search/pencarian2.dart';
import 'package:kostgo/search/pencarian3.dart';
import 'package:kostgo/search/pencarian4.dart';
import 'package:kostgo/search/pencarian5.dart';
import 'package:kostgo/themes/colors_theme.dart';
import 'package:kostgo/themes/fonts_theme.dart';

class Cari extends StatefulWidget {
  const Cari({super.key});

  @override
  _CariState createState() => _CariState();
}

class _CariState extends State<Cari> {
  List<Map<String, dynamic>> searchHistory = [
    {
      "name": "Kost Rumah Mawar Tipe A",
      "image": "images/rumahkostmawartipea.jpg",
      "page": Pencarian1()
    },
    {
      "name": "kost global",
      "image": "images/muara1.jpg",
      "page": Pencarian2(),
    },
    {
      "name": "kost global muara satu",
      "image": "images/muara1.jpg",
      "page": Pencarian2(),
    },
    {
      "name": "kost area blang mangat",
      "image": "images/blangmangat.png",
      "page": Pencarian3(),
    },
    {
      "name": "kost blang mangat",
      "image": "images/blangmangat.png",
      "page": Pencarian3(),
    },
    {
      "name": "kost impian",
      "image": "images/impian.png",
      "page": Pencarian4(),
    },
    {
      "name": "kost melur",
      "image": "images/melur.png",
      "page": Pencarian5(),
    },
  ];

  List<Map<String, dynamic>> filteredHistory = [];
  bool showAll = false;
  String searchText = '';

  @override
  void initState() {
    super.initState();
    filteredHistory = searchHistory;
  }

  void clearHistory() {
    setState(() {
      searchHistory.clear();
      filteredHistory.clear();
    });
  }

  void toggleShowAll() {
    setState(() {
      showAll = !showAll;
    });
  }

  void onSearchChanged(String value) {
    setState(() {
      searchText = value;
      if (value.isEmpty) {
        filteredHistory = searchHistory;
      } else {
        filteredHistory = searchHistory
            .where((item) =>
                item['name'].toLowerCase().contains(value.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int itemCount = showAll ? filteredHistory.length : 3;

    if (itemCount > filteredHistory.length) {
      itemCount = filteredHistory.length;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 85,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: blackColor,
            size: 30,
          ),
        ),
        backgroundColor: lightGreyColor,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            height: 45,
            child: TextField(
              onChanged: onSearchChanged,
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
          if (searchHistory.isNotEmpty)
            IconButton(
              icon: Icon(
                Icons.delete,
                color: darkBlueColor,
              ),
              onPressed: clearHistory,
              tooltip: 'Hapus Riwayat Pencarian',
            ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: filteredHistory.isEmpty
                ? Center(
                    child: Text(
                      "Tidak ditemukan",
                      style: lightBlackText.copyWith(fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      if (index < filteredHistory.length) {
                        final item = filteredHistory[index];
                        return ListTile(
                          title: Text(
                            item['name'],
                            style: lightBlackText.copyWith(fontSize: 16),
                          ),
                          leading: Image.asset(
                            item['image'],
                            width: 40,
                            height: 40,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => item['page']),
                            );
                          },
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
          ),
          if (filteredHistory.length > 3)
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 150.0),
                child: TextButton(
                  onPressed: toggleShowAll,
                  child: Text(
                    showAll ? "Sembunyikan" : "Lihat Semua",
                    style: TextStyle(color: darkBlueColor),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
