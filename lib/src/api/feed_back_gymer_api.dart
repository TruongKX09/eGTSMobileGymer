import 'dart:convert';

import 'package:egtsv1/src/common_data.dart';
import 'package:egtsv1/src/resources_gymer/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../router.dart';

class FeedBackGymerAPI {
  Future feedBackgymer(context, rate, feedbackGymer) async {
    String? token = await const FlutterSecureStorage().read(key: 'token');
    String ptFbId = await CommonData().getptFBID();
    String pkGFeedBack = await CommonData().getPGIDFeedback();

    try {
      http.Response response = await http.post(
        Uri.parse("$sPreApiUrl/Feedback/CreateFeedback"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
        body: jsonEncode({
          'ptidorNeid': ptFbId,
          'packageGymerId': pkGFeedBack,
          'rate': rate,
          'feedback1': feedbackGymer
        }),
      );
      if (response.statusCode == 400) {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Bạn Đã Gửi Đánh Giá Cho Gói Tập Này'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
                },
                child: const Text('Trở về'),
              ),
            ],
          ),
        );
        // return "Bạn đã đánh giá hợp đồng này rồi";
      } else if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Thành Công! Cảm Ơn Bạn Đã Đánh Giá Gói Tập'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Đóng'),
              ),
            ],
          ),
        );
      } else {
        return "Lỗi không xác định";
      }
    } catch (e) {
      rethrow;
    }
  }
}
