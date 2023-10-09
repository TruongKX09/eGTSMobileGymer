import 'dart:convert';
import 'package:egtsv1/src/common_data.dart';
import 'package:egtsv1/src/models/models_schedule/shedule_in_date_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import '../models/models_schedule/excerciseschedules_model.dart';
import '../router.dart';

class ExcerciseScheduleAPI {
  Future<ExcerciseSchedule> fetchExcerciseSchedule() async {
    String? token = await const FlutterSecureStorage().read(key: 'token');
    String userID = await CommonData().getUserID();

    try {
      http.Response response = await http.get(
        Uri.parse(
            "$sPreApiUrl/ExcerciseSchedules/GetExcerciseScheduleBygymerID/$userID"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );
      if (response.statusCode == 200) {
        final parsed =
            ExcerciseSchedule.fromJson(jsonDecode(response.body.toString()));
        return parsed;
      }

      return ExcerciseSchedule();
    } catch (e) {
      rethrow;
    }
  }

  Future<ScheduleInDate> fetchExcerciseScheduleByDate(
      String date, String id) async {
    String? token = await const FlutterSecureStorage().read(key: 'token');

    try {
      http.Response response = await http.get(
        Uri.parse(
            "$sPreApiUrl/Sessions/GetAllExcerciseInSessionWithScheduleIDAndDateTime?ScheduleID=$id&dateTime=$date"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );

      final parsed =
          ScheduleInDate.fromJson(jsonDecode(response.body.toString()));
      return parsed;
    } catch (e) {
      rethrow;
    }
  }
}
