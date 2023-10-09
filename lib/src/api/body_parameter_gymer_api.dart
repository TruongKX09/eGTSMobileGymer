import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../common_data.dart';
import '../models/body_parameter_gymer.model.dart';
import '../router.dart';

class GoalGymerAPI {
  Future<GoalGymer> fetchGoalGymer() async {
    String? token = await const FlutterSecureStorage().read(key: 'token');
    String sSearchGymer = await CommonData().getUserID();
    try {
      http.Response response = await http.get(
        Uri.parse(
            "$sPreApiUrl/BodyPerameters/GetBodyPerametersByGymerID/$sSearchGymer"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );
      final parsed = GoalGymer.fromJson(jsonDecode(response.body.toString()));

      return parsed;
    } catch (e) {
      rethrow;
    }
  }
}
