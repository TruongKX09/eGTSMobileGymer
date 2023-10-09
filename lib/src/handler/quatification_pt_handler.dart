import 'package:egtsv1/src/api/qualification_api.dart';

import 'package:egtsv1/src/models/qualification_model.dart';

class QualificationHandler {
  Future<Qualifications> onFetchQualification(String sSearchId) async {
    Qualifications qualifications =
        await QualificationAPI().fetchQualification(sSearchId);

    return qualifications;
  }
}
