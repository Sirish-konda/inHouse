import 'package:flutter/material.dart';
import 'package:fyp/features/home/plumber/plumber_notification_container.dart';

class PlumberNotificationPage extends StatelessWidget {
  const PlumberNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Notifications",
              style: TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 9,
                itemBuilder: (BuildContext context, int index) {
                  return PlumberNotificationContainer();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
