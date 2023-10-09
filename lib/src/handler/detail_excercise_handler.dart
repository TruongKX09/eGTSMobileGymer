import '../api/detail_excercise_api.dart';
import '../models/detail_excercise_model.dart';

class DetailExcercisePTHandler {
  Future<DetailExcerciseModel> onFetchDetailExcercisePT() async {
    DetailExcerciseModel advDetailExcercisePT =
        await DetailExcercisePTAPI().fetchDetailExcercisePT();
    if (200 == advDetailExcercisePT.code) {
      return advDetailExcercisePT;
    }
    return DetailExcerciseModel();
  }
}
