import 'package:flutter/material.dart';

import 'package:kostgo/chat/chatDetailPage1.dart';
import 'package:kostgo/favorite/favorite.dart';
import 'package:kostgo/profil/profilpage.dart';

import 'package:kostgo/screens/home_screen.dart';
import 'package:kostgo/search/search.dart';
import 'package:kostgo/themes/colors_theme.dart';

import 'chatDetailPage (2).dart';
import 'conversationList (1).dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Map<String, dynamic>> chatUsers = [
    {
      'name': 'Kos Mawar',
      'messageText': 'Iya, 5 menit kekampus',
      'imageUrl': 'images/ppmawar.png',
      'time': 'Now',
      'navigateTo': ChatDetailPage(),
    },
    {
      'name': 'Kos Muara Satu',
      'messageText': 'Bisa banget kak!',
      'imageUrl': 'images/avatarmuara.png',
      'time': 'Yesterday',
      'navigateTo': ChatDetailPage1(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
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
                  color: darkBlueColor,
                  size: 32,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilPage(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.person,
                  color: whiteColor, // Replace darkBlueColor with Colors.blue
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Chat",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(15),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 177, 157, 157),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.shade600,
                      size: 20,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding: const EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade100),
                    ),
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 16),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ConversationList(
                      name: chatUsers[index]['name'],
                      messageText: chatUsers[index]['messageText'],
                      imageUrl: chatUsers[index]['imageUrl'],
                      time: chatUsers[index]['time'],
                      isMessageRead: index == 0 || index == 1,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                chatUsers[index]['navigateTo'] as Widget,
                          ),
                        );
                      },
                    ),
                    const Divider(
                      height: 20,
                      thickness: 1,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
