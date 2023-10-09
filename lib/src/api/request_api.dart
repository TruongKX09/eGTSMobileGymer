import 'dart:convert';

import 'package:egtsv1/src/common_data.dart';

import 'package:http/http.dart' as http;

import '../models/create_request_model.dart';
import '../router.dart';

class CreateRequestAPI {
  Future<CreateRequest> callCreateRequest() async {
    String userID = await CommonData().getUserID();
    String ptID = await CommonData().getPTID();
    String pgID = await CommonData().getPGID();

    try {
      http.Response response = await http.post(
        Uri.parse("$sPreApiUrl/Requests/CreateRequest"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'gymerID': userID,
          'receiverId': ptID,
          'packageGymerId': pgID,
        }),
      );

      final parsed =
          CreateRequest.fromJson(jsonDecode(response.body.toString()));

      return parsed;
    } catch (e) {
      rethrow;
    }
  }
}
