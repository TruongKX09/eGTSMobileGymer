import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../common_data.dart';
import '../models/qualification_model.dart';
import '../router.dart';

class QualificationAPI {
  Future<Qualifications> fetchQualification(String sSearchId) async {
    String? token = await const FlutterSecureStorage().read(key: 'token');

    try {
      http.Response response = await http.get(
        Uri.parse(
            "$sPreApiUrl/Qualifications/GetQualificationByAccountId/$sSearchId"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );
      if (response.statusCode == 200) {
        final parsed =
            Qualifications.fromJson(jsonDecode(response.body.toString()));

        CommonData().setPTID(sSearchId);

        return parsed;
      } else {
        return Qualifications();
      }
    } catch (e) {
      rethrow;
    }
  }
}
