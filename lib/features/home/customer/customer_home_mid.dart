import 'package:flutter/material.dart';

class CustomerHomeMid extends StatelessWidget {
  const CustomerHomeMid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Good Morning',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'poppins',
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.notifications_active_outlined,
                color: Colors.black,
                size: 35,
              ),
            ],
          ),

          //adding name of the plumber
          const Text(
            'Andrew Suwal',
            style: TextStyle(
              color: Colors.green,
              fontFamily: 'poppins',
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "We're thrilled to have you join the Andrew community! Your reliable and efficient solution for all your plumbing needs is now just a tap away. Get ready to experience hassle-free plumbing services and say goodbye to leaks and clogs!",
            style: TextStyle(
              fontFamily: 'poppins',
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Color.fromARGB(255, 207, 207, 207),
          ),
        ],
      ),
    );
  }
}
