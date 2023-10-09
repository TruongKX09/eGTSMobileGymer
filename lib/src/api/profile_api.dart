import 'dart:convert';

import 'package:egtsv1/src/models/profile_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../common_data.dart';

import '../router.dart';

class ProfileAPI {
  Future<Profile> fetchProfile() async {
    String? token = await const FlutterSecureStorage().read(key: 'token');
    String sSearchID = await CommonData().getUserID();
    try {
      http.Response response = await http.get(
        Uri.parse("$sPreApiUrl/Accounts/GetAccountByID/$sSearchID"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );
      if (response.statusCode == 200) {
        final parsed = Profile.fromJson(jsonDecode(response.body.toString()));

        return parsed;
      } else {
        return Profile();
      }
    } catch (e) {
      rethrow;
    }
  }
}
