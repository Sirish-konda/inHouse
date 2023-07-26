import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomerSerivces extends StatelessWidget {
  final VoidCallback ontap;
  String title;
  String desc;
  int price;
  IconData? iconValue;

  CustomerSerivces({
    required this.ontap,
    required this.title,
    required this.desc,
    required this.price,
    required this.iconValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
        left: 14,
      ),
      child: Container(
        height: 110,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 236, 235, 235),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.green,
                radius: 35,
                child: Icon(
                  iconValue,
                  color: Colors.white,
                  size: 45,
                ),
              ),
              const SizedBox(
                width: 26,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        desc,
                        style: const TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: ontap,
                    child: Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                          child: Text(
                        'View',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'poppins',
                        ),
                      )),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
