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
                text: 'History',
                onTap: () {},
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
