import 'package:flutter/material.dart';
import 'package:fyp/features/home/customer/customer_notification_box.dart';

class CustomerNotificationPage extends StatelessWidget {
  final names = [
    'Andrew',
    'Suwal',
  ];
  final status = [
    true,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 26,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Notifications',
              style: TextStyle(
                color: Colors.black,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomerNotificationBox(
                    name: names[index],
                    status: status[index],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
