import 'package:egtsv1/src/api/session_result_api.dart';
import 'package:egtsv1/src/models/session_result_model.dart';

class SessionResultHandler {
  Future<SessionResultModel> onfetSessionResult(sessionId) async {
    SessionResultModel onfetSessionResult =
        await SessionResultAPI().fetSessionResult(sessionId);
    if (200 == onfetSessionResult.code) {
      return onfetSessionResult;
    }
    return SessionResultModel();
  }
}
