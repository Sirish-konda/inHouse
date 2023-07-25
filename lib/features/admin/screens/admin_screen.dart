import 'package:flutter/material.dart';
import 'package:fyp/features/admin/screens/posts_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  void updatePage(int Page) {
    setState(() {
      _page = Page;
    });
  }

  List<Widget> pages = [
    const PostsScreen(),
    Center(
      child: Text('ss'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('In-house'),
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        onTap: updatePage,
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
            label: 'Order',
            icon: SizedBox(
              width: bottomBarWidth,
              child: const Icon(
                Icons.all_inbox_outlined,
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
