import 'dart:convert';

import 'package:egtsv1/src/common_data.dart';

import 'package:http/http.dart' as http;
import '../models/create_body_parameter._model.dart';
import '../router.dart';

class CreateBodyParameterAPI {
  Future<BodyParameter> createBodyParameter(context, goal, wei, hei) async {
    String gymerID = await CommonData().getUserID();
    try {
      http.Response response = await http.post(
        Uri.parse("$sPreApiUrl/BodyPerameters/CreateBodyPerameter"),
        body: jsonEncode({
          'gymerId': gymerID,
          'goal': goal,
          'weight': int.parse(wei),
          'height': int.parse(hei),
          //'bone': bone,
          // 'fat': fat,
          // 'muscle': muscle,
        }),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
        },
      );

      final parsed =
          BodyParameter.fromJson(jsonDecode(response.body.toString()));
      return parsed;
    } catch (e) {
      rethrow;
    }
  }
}
