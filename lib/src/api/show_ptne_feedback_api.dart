import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../models/show_feedback_gymer_model.dart';
import '../router.dart';

class ShowPTNEFeedBackAPI {
  Future<ShowFeedBackPtne> fetchShowPTNEFeedBack(ptneID) async {
    String? token = await const FlutterSecureStorage().read(key: 'token');

    try {
      http.Response response = await http.get(
        Uri.parse(
            "$sPreApiUrl/Feedback/GetFeedbackListByExpertID?expertID=$ptneID"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );
      final parsed =
          ShowFeedBackPtne.fromJson(jsonDecode(response.body.toString()));

      return parsed;
    } catch (e) {
      rethrow;
    }
  }
}
