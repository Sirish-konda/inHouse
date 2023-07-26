import 'package:flutter/material.dart';
import 'package:fyp/features/home/plumber/plumber_home_bottom.dart';
import 'package:fyp/features/home/plumber/plumber_home_mid.dart';
import 'package:fyp/features/home/plumber/plumber_home_top.dart';

class PlumberHome extends StatelessWidget {
  const PlumberHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              child: ListView(
                children: const [
                  PlumberHomeTop(),
                  //adding welcome text
                  PlumberHomeMid(),
                  PlumberHomeBottom(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
