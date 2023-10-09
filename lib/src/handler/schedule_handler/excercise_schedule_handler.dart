import 'package:egtsv1/src/models/models_schedule/sessionexcercise_model.dart';
import 'package:egtsv1/src/models/models_schedule/shedule_in_date_model.dart';

import '../../api/excercises_chedule_api.dart';
import '../../api/session_byschedule_api.dart';
import '../../api/session_excercise_api.dart';
import '../../models/models_schedule/excerciseschedules_model.dart';
import '../../models/models_schedule/sessionbyschedule_model.dart';

class ScheduleGymer {
  //1
  Future<ExcerciseSchedule> onFetchExcerciseSchedule() async {
    ExcerciseSchedule advExcerciseSchedule =
        await ExcerciseScheduleAPI().fetchExcerciseSchedule();
    if (200 == advExcerciseSchedule.code) {
      return advExcerciseSchedule;
    }
    return ExcerciseSchedule();
  }

  //2
  Future<SessionBySchedule> onFetchSessionBySchedule(String sSearchId) async {
    SessionBySchedule sessionBySchedule =
        await SessionByScheduleAPI().fetchSessionBySchedule(sSearchId);
    if (200 == sessionBySchedule.code) {
      return sessionBySchedule;
    }
    return SessionBySchedule();
  }

  //3
  Future<SessionExcercise> onFetchSessionExercise(String sSearchId) async {
    SessionExcercise sessionExcercise =
        await SessionExcerciseAPI().fetchSessionExcercise(sSearchId);
    if (200 == sessionExcercise.code) {
      return sessionExcercise;
    }
    return SessionExcercise();
  }

  Future<ScheduleInDate> onFetchAllSchedule(
      String scheID, String dateTime) async {
    ScheduleInDate scheduleInDate = await ExcerciseScheduleAPI()
        .fetchExcerciseScheduleByDate(dateTime, scheID);
    if (200 == scheduleInDate.code) {
      return scheduleInDate;
    }

    return ScheduleInDate();
  }
}
