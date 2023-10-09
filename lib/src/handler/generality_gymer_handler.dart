import 'package:egtsv1/src/api/generality_gymer_api.dart';

import 'package:egtsv1/src/models/generality_gymer_model.dart';

class GeneralityGymerHandler {
  Future<GeneralityGymer> onFetMenuGymer() async {
    GeneralityGymer advGeneralityGymer =
        await GeneralityGymerAPI().getGeneralityGymer();
    if (200 == advGeneralityGymer.code) {
      return advGeneralityGymer;
    }
    return GeneralityGymer();
  }
}
