import 'package:egtsv1/src/models/body_parameter_gymer.model.dart';

import '../api/body_parameter_gymer_api.dart';

class GoalGymerHandler {
  Future<GoalGymer> onFetchListGoal() async {
    GoalGymer advGoalRequest = await GoalGymerAPI().fetchGoalGymer();
    if (200 == advGoalRequest.code) {
      return advGoalRequest;
    }
    return GoalGymer();
  }
}
