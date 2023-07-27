import 'package:flutter/material.dart';
import 'package:fyp/common/custom_button.dart';
import 'package:fyp/features/account/services/account_services.dart';
import 'package:fyp/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountServices accountServices = AccountServices();
    void logout(BuildContext context) {
      accountServices.logOut(context);
    }

    void _showAboutUsDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('About Us'),
            content: Text(
                '''In-House Service" is an innovative plumbing app that aims to revolutionize home maintenance. With a user-friendly interface, real-time tracking, and secure payments, we provide hassle-free plumbing services. We value customer loyalty and offer exclusive discounts. Our vision expands beyond plumbing, aiming to be a holistic home service platform. With qualified service providers and a customer-centric approach, we strive to set new industry standards and redefine home maintenance experiences. Join us to experience effortless and reliable plumbing solutions, making your home a better place.'''),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            'Profile',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 29,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green.withOpacity(0.5),
                ),
                child: Text(
                  'Hello ${Provider.of<UserProvider>(context).user.name.toUpperCase()}',
                  style: const TextStyle(
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'About Us',
                onTap: () {
                  _showAboutUsDialog(context);
                },
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'Log Out',
                onTap: () => logout(context),
              ),
            ],
          ),
        ));
  }
}
