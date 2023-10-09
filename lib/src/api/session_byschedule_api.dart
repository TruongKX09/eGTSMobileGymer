import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import '../models/models_schedule/sessionbyschedule_model.dart';
import '../router.dart';

class SessionByScheduleAPI {
  Future<SessionBySchedule> fetchSessionBySchedule(String sSearchId) async {
    String? token = await const FlutterSecureStorage().read(key: 'token');

    try {
      http.Response response = await http.get(
        Uri.parse("$sPreApiUrl/Sessions/GetSessionByScheduleID?id=$sSearchId"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );
      final parsed =
          SessionBySchedule.fromJson(jsonDecode(response.body.toString()));
      return parsed;
    } catch (e) {
      rethrow;
    }
  }
}
