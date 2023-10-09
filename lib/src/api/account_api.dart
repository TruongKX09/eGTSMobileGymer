import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/user_model.dart';
import 'package:http/http.dart' as http;
import '../router.dart';

class AccountAPI {
  Future<List<DataUser>> fetchByName(String sSearchName) async {
    String? token = await const FlutterSecureStorage().read(key: 'token');
    try {
      http.Response response = await http.get(
        Uri.parse("$sPreApiUrl/Accounts/SearchAccountByName/$sSearchName"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );
      if (200 == response.statusCode) {
        final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
        return parsed.map<DataUser>((json) => DataUser.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  Future<Account> fetchByRole(String sSearchRole) async {
    String? token = await const FlutterSecureStorage().read(key: 'token');
    try {
      http.Response response = await http.get(
        Uri.parse(
            "$sPreApiUrl/Accounts/GetAllAccountsWithConditons?role=$sSearchRole"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );
      if (200 == response.statusCode) {
        final parsed = Account.fromJson(jsonDecode(response.body.toString()));
        return parsed;
      }
      return Account();
    } catch (e) {
      rethrow;
    }
  }

  Future<Account> fetchAll() async {
    String? token = await const FlutterSecureStorage().read(key: 'token');
    try {
      http.Response response = await http.get(
        Uri.parse("$sPreApiUrl/Accounts/GetAllAccountsWithConditons"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );
      if (200 == response.statusCode) {
        final parsed = Account.fromJson(jsonDecode(response.body.toString()));
        return parsed;
      }
      return Account();
    } catch (e) {
      rethrow;
    }
  }
}
