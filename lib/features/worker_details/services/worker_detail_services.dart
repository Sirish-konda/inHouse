import 'dart:convert';

import 'package:fyp/constants/error_handling.dart';
import 'package:fyp/constants/global_variables.dart';
import 'package:fyp/models/worker.dart';
import 'package:flutter/material.dart';
import 'package:fyp/constants/utils.dart';
import 'package:fyp/providers/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class WorkerDetailsService {
  // ignore_for_file: use_build_context_synchronously

  void rateWorker({
    required BuildContext context,
    required Worker worker,
    required double rating,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response response = await http.post(
        Uri.parse('$uri/api/rate-worker'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode(
          {
            'id': worker.id!,
            'rating': rating,
          },
        ),
      );

      httpErrorHandle(response: response, context: context, onSuccess: () {});
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }
}
