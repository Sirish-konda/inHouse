import 'package:flutter/material.dart';
import 'package:fyp/features/home/customer/customer_home_bottom.dart';
import 'package:fyp/features/home/plumber/plumber_home_bottom.dart';
import 'package:fyp/features/home/plumber/plumber_home_mid.dart';
import 'package:fyp/features/home/plumber/plumber_home_top.dart';

import 'package:fyp/features/home/screens/category_screen.dart';

import 'package:fyp/features/search/search_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void navigateToCategoryPage(String category) {
    Navigator.pushNamed(context, CategoryScreen.routeName, arguments: category);
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 6,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 1,
                          ),
                        ),
                        hintText: 'Search Plumber',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              // child: Expanded(
              //   child: ListView(
              //     children: [
              // AddressBox(
              //   navigateToAddress: () {
              //     Navigator.pushNamed(context, AddressScreen.routeName);
              //   },
              // ),
              // PlumberHomeTop(),
              // PlumberHomeMid(),
              // CustomerHomeBottom(),

              InkWell(
            onTap: () {
              navigateToCategoryPage('Plumber');
            },
            child: Text('asdasdas'),
          )
          //     ],
          //   ),
          // ),
          ),
    );
  }
}
