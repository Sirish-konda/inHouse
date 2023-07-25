// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp/constants/error_handling.dart';
import 'package:fyp/constants/global_variables.dart';
import 'package:fyp/constants/utils.dart';
import 'package:fyp/models/worker.dart';
import 'package:fyp/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomeServices {
  Future<List<Worker>> fetchCategoryWorkers({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Worker> workerList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/workers'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            workerList.add(
              Worker.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return workerList;
  }

  // Future<Worker> fetchDealOfDay({
  //   required BuildContext context,
  // }) async {
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);
  //   Worker product = Worker(
  //     name: '',
  //     description: '',
  //     fee: 0,
  //     profilePicture: '',
  //     gender: '',
  //   );

  //   try {
  //     http.Response res =
  //         await http.get(Uri.parse('$uri/api/deal-of-day'), headers: {
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'x-auth-token': userProvider.user.token,
  //     });

  //     httpErrorHandle(
  //       response: res,
  //       context: context,
  //       onSuccess: () {
  //         product = Worker.fromJson(res.body);
  //       },
  //     );
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
  //   return product;
  // }
}
