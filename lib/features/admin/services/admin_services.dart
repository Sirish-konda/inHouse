// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:fyp/constants/error_handling.dart';
import 'package:fyp/constants/global_variables.dart';
import 'package:fyp/models/worker.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:fyp/constants/utils.dart';
import 'package:fyp/providers/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AdminServices {
  void addWorker({
    required BuildContext context,
    required String name,
    required String description,
    required double fee,
    required String gender,
    required File profilePicture,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic('dozhc4wvj', 'nfsnnvq4');
      String imageName;

      CloudinaryResponse res = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(profilePicture.path, folder: name),
      );

      imageName = res.secureUrl;

      Worker worker = Worker(
        name: name,
        description: description,
        fee: fee,
        gender: gender,
        profilePicture: imageName,
      );

      http.Response response = await http.post(
        Uri.parse('$uri/admin/add-worker'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: worker.toJson(),
      );

      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            "Woker added successfully",
          );
          Navigator.pop(context);
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

  //fetch all workerss

  Future<List<Worker>> fetchAllWorkers(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    List<Worker> workerList = [];

    try {
      http.Response res = await http.get(
        Uri.parse('$uri/admin/get-workers'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      print(res.body);
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
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return workerList;
  }

  void deleteWorker({
    required BuildContext context,
    required Worker worker,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/delete-worker'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': worker.id,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          onSuccess();
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
