import 'package:flutter/material.dart';
import 'package:fyp/features/account/screens/account_screen.dart';
import 'package:fyp/features/home/screens/home_screens.dart';
import 'package:fyp/features/order/screens/order_screen.dart';
import 'package:fyp/features/order/services/order_services.dart';
import 'package:fyp/models/order.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<Order>? orders;
  final OrderServices orderServices = OrderServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await orderServices.fetchMyOrders(context: context);
    setState(() {});
  }

  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  void updatePage(int Page) {
    setState(() {
      _page = Page;
    });
  }

  List<Widget> pages = [
    const HomeScreen(),
    const OrderScreen(),
    const AccountsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            label: 'Notification',
            icon: SizedBox(
                width: bottomBarWidth,
                child: const Icon(Icons.notification_add)),
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
