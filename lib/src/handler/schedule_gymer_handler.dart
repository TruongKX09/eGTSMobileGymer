import 'package:egtsv1/src/api/schedule_gymer_api.dart';
import 'package:egtsv1/src/models/schedule_gymer_model.dart';

class ScheduleGymerHandler {
  Future<ScheduleGymerModel> onFetScheduleGymer(
      String dateTime, context) async {
    dateTime = dateTime.substring(0, 10);
    ScheduleGymerModel advSchedulGymer =
        await ScheduleGymerAPI().fetchScheduleGymerByDate(dateTime, context);
    if (200 == advSchedulGymer.code) {
      return advSchedulGymer;
    }
    return ScheduleGymerModel();
  }
}
