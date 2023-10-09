import 'dart:convert';

import 'package:egtsv1/src/common_data.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../router.dart';

class PaymentPkGymerAPI {
  Future<String> paymentGymerPackage(String packageID) async {
    String? token = await const FlutterSecureStorage().read(key: 'token');
    String userID = await CommonData().getUserID();
    try {
      http.Response response = await http.post(
        Uri.parse("$sPreApiUrl/VNPay/CreatePayment"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
        body: jsonEncode({
          'gymerID': userID,
          'packageID': packageID,
        }),
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return '';
      }
    } catch (e) {
      rethrow;
    }
  }
}
