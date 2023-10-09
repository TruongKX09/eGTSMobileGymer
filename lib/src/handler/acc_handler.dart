import 'package:egtsv1/src/common_data.dart';

import '../api/account_api.dart';
import '../models/user_model.dart';

class AccountHandler {
  Future<List<DataUser>?> fetchAccountsByName(String name) async {
    List<DataUser> result = await AccountAPI().fetchByName(name);

    return result;
  }

  Future<List<DataUser>?> fetchAccountsByRole(String role) async {
    Account result = await AccountAPI().fetchByRole(role);

    return result.data;
  }

  Future<List<DataUser>?> fetchAccountAll() async {
    Account result = await AccountAPI().fetchAll();

    return result.data;
  }

  Future<List<DataUser>?> fetchAccountsByMethod(String sSearch) async {
    List<DataUser>? res = <DataUser>[];
    if (sSearch.isEmpty) {
      res = await fetchAccountAll();
    } else {
      if (CommonData().isMatchRolePTNE(sSearch)) {
        res = await fetchAccountsByRole(sSearch);
      } else {
        res = await fetchAccountsByName(sSearch);
      }
    }
    if (res!.isNotEmpty) {
      res.removeWhere((element) =>
          (!CommonData().isMatchRolePTNE(element.role) || element.isDelete!));
    }
    res.sort((a, b) => a.role!.compareTo(b.role!));

    return res;
  }

  Future<List<DataUser>?> fetchAccountsByRoleAndName(
      String role, String sSearch) async {
    List<DataUser>? res = <DataUser>[];
    res = await fetchAccountsByRole(role);

    if (res!.isNotEmpty && sSearch.isNotEmpty) {
      res.removeWhere((element) =>
          !element.fullname!.toLowerCase().contains(sSearch.toLowerCase()));
    }
    res.removeWhere((element) => (element.isDelete! == true));
    return res;
  }
}
