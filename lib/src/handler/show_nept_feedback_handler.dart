import '../api/show_ptne_feedback_api.dart';
import '../models/show_feedback_gymer_model.dart';

class ShowPTNEFeedBackHandler {
  Future<ShowFeedBackPtne> showPTNEFeedBack(ptneID) async {
    ShowFeedBackPtne advPTNEFeedback =
        await ShowPTNEFeedBackAPI().fetchShowPTNEFeedBack(ptneID);
    if (200 == advPTNEFeedback.code) {
      return advPTNEFeedback;
    }
    return ShowFeedBackPtne();
  }
}
