import 'package:flutter/material.dart';
import 'package:kostgo/screens/home_screen.dart';
import 'package:kostgo/themes/colors_theme.dart';

class Tampilan extends StatelessWidget {
  const Tampilan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
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
                child: Icon(
                  Icons.home,
                  color: whiteColor,
                  size: 32,
                ),
              ),
              Icon(
                Icons.search,
                color: whiteColor,
                size: 32,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                child: Icon(
                  Icons.favorite_border,
                  color: whiteColor,
                  size: 32,
                ),
              ),
              Icon(
                Icons.message,
                color: whiteColor,
                size: 32,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                },
                child: Icon(
                  Icons.person,
                  color: whiteColor,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
