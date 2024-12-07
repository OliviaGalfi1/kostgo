import 'package:flutter/material.dart';
import 'package:kostgo/themes/colors_theme.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: FilterDrawer(), // Drawer untuk filter dari samping kanan
      backgroundColor: Colors.blue,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Container(
          height: 59,
          width: 342,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.home,
                color: Colors.white,
                size: 32,
              ),
              Icon(
                Icons.search,
                color: Colors.blue,
                size: 32,
              ),
              Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 32,
              ),
              Icon(
                Icons.message,
                color: Colors.white,
                size: 32,
              ),
              Icon(
                Icons.person,
                color: Colors.white,
                size: 32,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 50,
                horizontal: 18,
              ),
              child: Row(
                children: [
                  const Expanded(
                    flex: 9,
                    child: InkWell(
                      child: TextField(
                        decoration: InputDecoration(
                          enabled: false,
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 1,
                    child: Builder(
                      builder: (context) => IconButton(
                        icon: const Icon(
                          Icons.tune_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          // Memanggil endDrawer dari Scaffold saat ikon filter ditekan
                          Scaffold.of(context).openEndDrawer();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterDrawer extends StatefulWidget {
  @override
  _FilterDrawerState createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  // Indeks terpilih untuk setiap kategori filter
  int? _selectedLocation;
  int? _selectedGender;
  int? _selectedDuration;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 45,
          right: 30,
          left: 18,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pilih Sesuai Keinginanmu",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const Divider(),
            _buildFilterSection(
                "Lokasi",
                ["Muara Satu", "Muara Dua", "Banda Sakti", "Blang Mangat"],
                _selectedLocation, (index) {
              setState(() {
                _selectedLocation = index;
              });
            }),
            const Divider(),
            _buildFilterSection("Gender", ["Pria", "Wanita"], _selectedGender,
                (index) {
              setState(() {
                _selectedGender = index;
              });
            }),
            const Divider(),
            _buildFilterSection(
                "Durasi Sewa",
                ["Harian", "Mingguan", "Per Bulan", "Per Tahun"],
                _selectedDuration, (index) {
              setState(() {
                _selectedDuration = index;
              });
            }),
            const SizedBox(height: 150),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: darkBlueColor,
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: darkBlueColor),
                  ),
                  onPressed: () {
                    setState(() {
                      // Mengatur ulang semua filter
                      _selectedLocation = null;
                      _selectedGender = null;
                      _selectedDuration = null;
                    });
                  },
                  child: const Text("Hapus"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: darkBlueColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Logika untuk menerapkan filter
                  },
                  child: const Text("Cari"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterSection(String title, List<String> options,
      int? selectedIndex, Function(int) onSelected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: List<Widget>.generate(options.length, (int index) {
            return ChoiceChip(
              label: Text(options[index]),
              selected: selectedIndex == index,
              onSelected: (bool selected) {
                onSelected(selected ? index : -1);
              },
              selectedColor: const Color(0xD4CCC6C6),
            );
          }),
        ),
      ],
    );
  }
}
