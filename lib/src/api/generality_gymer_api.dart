import 'dart:convert';

import 'package:egtsv1/src/models/generality_gymer_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;
import '../common_data.dart';
import '../router.dart';

class GeneralityGymerAPI {
  Future<GeneralityGymer> getGeneralityGymer() async {
    String? token = await const FlutterSecureStorage().read(key: 'token');
    String gymerId = await CommonData().getUserID();
    try {
      http.Response response = await http.get(
        Uri.parse(
            "$sPreApiUrl/ExcerciseSchedules/GetExcerciseScheduleByGymerIDV2/$gymerId"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );

      if (response.statusCode == 200) {
        final parsed =
            GeneralityGymer.fromJson(jsonDecode(response.body.toString()));

        return parsed;
      } else {
        return GeneralityGymer();
      }
    } catch (e) {
      rethrow;
    }
  }
}
