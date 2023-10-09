import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import '../common_data.dart';
import '../models/detail_excercise_model.dart';
import '../router.dart';

class DetailExcercisePTAPI {
  Future<DetailExcerciseModel> fetchDetailExcercisePT() async {
    String? token = await const FlutterSecureStorage().read(key: 'token');
    String excerciseID = await CommonData().getExcerciseID();
    try {
      http.Response response = await http.get(
        Uri.parse("$sPreApiUrl/Excercises/GetExcerciseByID/$excerciseID"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );
      final parsed =
          DetailExcerciseModel.fromJson(jsonDecode(response.body.toString()));

      return parsed;
    } catch (e) {
      rethrow;
    }
  }
}
