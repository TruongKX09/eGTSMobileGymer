import 'dart:convert';
import 'package:egtsv1/src/common_data.dart';
import 'package:egtsv1/src/models/detail_packagegymer_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import '../router.dart';

class PackageGymerAPI {
  Future<PackageGymer> fetchPackageGymer() async {
    String? token = await const FlutterSecureStorage().read(key: 'token');
    String sSearchId = await CommonData().getUserID();

    try {
      http.Response response = await http.get(
        Uri.parse(
            "$sPreApiUrl/PackageGymers/GetPackageGymerByGymerID?request=$sSearchId"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );
      final parsed =
          PackageGymer.fromJson(jsonDecode(response.body.toString()));

      return parsed;
    } catch (e) {
      rethrow;
    }
  }
}
