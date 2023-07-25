import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fyp/constants/error_handling.dart';
import 'package:fyp/constants/global_variables.dart';
import 'package:fyp/constants/utils.dart';
import 'package:fyp/models/worker.dart';
import 'package:fyp/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SearchServices {
  Future<List<Worker>> fetchSearchedProduct({
    required BuildContext context,
    required String searchQuery,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Worker> productList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/api/workers/search/$searchQuery'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
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
    return productList;
  }
}
