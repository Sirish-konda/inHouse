import 'package:flutter/material.dart';

class CustomerNotificationBox extends StatelessWidget {
  final String name;
  final bool status;

  CustomerNotificationBox({
    required this.name,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 12,
      ),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: status ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 42,
                backgroundImage: AssetImage(
                  'images/plumber.jpg',
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: status
                    ? Text(
                        "Your order has been accepted by $name.",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      )
                    : Text(
                        "Your order has been rejected by $name.",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
