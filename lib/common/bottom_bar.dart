import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: SizedBox(
              width: bottomBarWidth,
              child: const Icon(
                Icons.home,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Notification',
            icon: SizedBox(
              width: bottomBarWidth,
              child: const badges.Badge(
                badgeContent: Text('1'),
                badgeStyle: badges.BadgeStyle(badgeColor: Colors.white),
                child: Icon(
                  Icons.plumbing_outlined,
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: SizedBox(
              width: bottomBarWidth,
              child: const Icon(
                Icons.person,
              ),
            ),
          ),
        ],
        currentIndex: _page,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        backgroundColor: Colors.black.withOpacity(0.3),
        elevation: 0,
        iconSize: 28,
      ),
    );
  }
}
