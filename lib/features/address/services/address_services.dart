// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:fyp/constants/error_handling.dart';
import 'package:fyp/constants/global_variables.dart';
import 'package:fyp/models/user.dart';
import 'package:flutter/material.dart';
import 'package:fyp/constants/utils.dart';
import 'package:fyp/models/worker.dart';
import 'package:fyp/providers/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AddressServices {
  void saveUserAddress({
    required BuildContext context,
    required String address,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/save-user-address'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'address': address,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          User user = userProvider.user.copyWith(
            address: jsonDecode(res.body)['address'],
          );
          userProvider.setUserFromModel(user);
        },
      );
    } catch (e) {
      print(e);
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }

  void placeOrder({
    required BuildContext context,
    required String address,
    required double totalSum,
    required Worker worker,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      print('object');
      print(worker.id);
      http.Response res = await http.post(
        Uri.parse('$uri/api/order'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode(
          {
            'address': address,
            'totalPrice': totalSum,
            'workerD': worker,
          },
        ),
      );

      print(res.body);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Your order has been placed!');
          Navigator.pop(context);
        },
      );
    } catch (e) {
      print(e);
      showSnackBar(context, e.toString());
    }
  }

  //fetch all workerss
}
