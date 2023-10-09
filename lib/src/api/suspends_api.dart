import 'dart:convert';

import 'package:egtsv1/src/ultils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../resources_gymer/home_page.dart';
import '../router.dart';

class SuspendsGymerAPI {
  Future<String> suspendsGymer(
      context, packageGymerID, startDate, enDate, reason) async {
    String? token = await const FlutterSecureStorage().read(key: 'token');

    try {
      http.Response response = await http.post(
        Uri.parse("$sPreApiUrl/Suspends/CreateSuspend"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
        body: jsonEncode({
          'packageGymerId': packageGymerID,
          'from': startDate.toString().substring(0, 10),
          'to': enDate.toString().substring(0, 10),
          'reason': reason
        }),
      );

      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text(
              'Tạm Ngưng Gói Tập Thành Công!',
              style: titleStyle,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text('Đóng'),
              ),
            ],
          ),
        );

        return response.body;
      } else {
        Navigator.of(context).pop();
        var responseBody = jsonDecode(response.body);

        final snackBar = SnackBar(
          content: Text(responseBody['message']),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 100,
            left: 10,
            right: 10,
          ),
        );

        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return "";
      }
    } catch (e) {
      rethrow;
    }
  }
}
