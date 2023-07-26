import 'package:flutter/material.dart';
import 'package:fyp/features/home/customer/customer_services.dart';

class CustomerHomeBottom extends StatelessWidget {
  const CustomerHomeBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: 14,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Our Services',
                style: TextStyle(
                  color: Colors.green,
                  fontFamily: 'poppins',
                  fontSize: 20,
                ),
              ),
              Row(
                children: [
                  Text(
                    'View all',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'poppins',
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.green,
                    size: 17,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
        
        ],
      ),
    );
  }
}
