import 'dart:convert';

import 'package:egtsv1/src/models/gym_pack_model.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../router.dart';

class PTPackAPI {
  Future<AdPackage> fetchAdvPackage() async {
    String? token = await const FlutterSecureStorage().read(key: 'token');

    try {
      http.Response response = await http.get(
        Uri.parse("$sPreApiUrl/Packages/GetPackagesForMobile"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );
      final parsed = AdPackage.fromJson(jsonDecode(response.body.toString()));
      return parsed;
    } catch (e) {
      rethrow;
    }
  }

  // Future createGymerPackage(String packageID) async {
  //   String? token = await const FlutterSecureStorage().read(key: 'token');
  //   String userID = await CommonData().getUserID();
  //   try {
  //     http.Response response = await http.post(
  //       Uri.parse("$sPreApiUrl/PackageGymers/CreatePackageGymer"),
  //       headers: <String, String>{
  //         'accept': 'text/plain',
  //         'Content-Type': 'application/json',
  //         'token': 'Bearer $token'
  //       },
  //       body: jsonEncode({
  //         'gymerID': userID,
  //         'packageID': packageID,
  //       }),
  //     );
  //     if (response.statusCode == 200) {
  //       CommonData().setNewBuyPkgID(packageID);
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
