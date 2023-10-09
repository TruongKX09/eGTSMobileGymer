import 'dart:convert';

import 'package:egtsv1/src/common_data.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../models/menu_gymer_model.dart';

import '../router.dart';

class MenuGymerAPI {
  Future<MenuGymerModel> fetchMenuGymerByDate(String date, mealTime) async {
    String? token = await const FlutterSecureStorage().read(key: 'token');
    String gymerID = await CommonData().getUserID();

    try {
      http.Response response = await http.get(
        Uri.parse(
            "$sPreApiUrl/NutritionSchedules/GetMealByGymerIDAndDateAndMealTime/$gymerID?date=$date&MealTime=$mealTime"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );

      final parsed =
          MenuGymerModel.fromJson(jsonDecode(response.body.toString()));
      return parsed;
    } catch (e) {
      rethrow;
    }
  }
}
