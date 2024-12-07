import 'package:flutter/material.dart';
import 'package:kostgo/chat/chatPage1.dart';
import 'package:kostgo/favorite/detailfav.dart';
import 'package:kostgo/favorite/kostSaya.dart';
import 'package:kostgo/profil/profilpage.dart';
import 'package:kostgo/screens/home_screen.dart';
import 'package:kostgo/search/search.dart';
import 'package:kostgo/themes/colors_theme.dart';
import 'package:kostgo/themes/fonts_theme.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    ),
                  );
                },
                child: const Icon(
                  Icons.home,
                  color: whiteColor,
                  size: 32,
                ),
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
              const Icon(
                Icons.favorite_border,
                color: darkBlueColor,
                size: 32,
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
                      builder: (context) => const ProfilPage(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.person,
                  color: whiteColor,
                  size: 32,
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 80,
            width: 420,
            decoration: const BoxDecoration(color: darkBlueColor),
          ),
          const SizedBox(
            height: 32,
          ),

          // Todo Kost Saya
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Kostsaya(),
                    ),
                  );
                },
                child: Container(
                  width: 348,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: const Color(0xFFD9D9D9),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Kost Saya",
                              style: boldBlackText.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                "1",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "See All",
                            style: TextStyle(
                              color: Color.fromRGBO(2, 43, 96, 100),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Detailfav(),
                    ),
                  );
                },
                // Todo FavoriteAngak lama sabar ya
                child: Container(
                  width: 348,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: const Color(0xFFD9D9D9),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Favorite",
                              style: boldBlackText.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                "5",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "See All",
                            style: TextStyle(
                              color: Color.fromRGBO(2, 43, 96, 100),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
