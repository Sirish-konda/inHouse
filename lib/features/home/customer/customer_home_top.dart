import 'package:flutter/material.dart';

class CustomerHomeTop extends StatelessWidget {
  const CustomerHomeTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
            image: AssetImage(
              'images/home_image.webp',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
