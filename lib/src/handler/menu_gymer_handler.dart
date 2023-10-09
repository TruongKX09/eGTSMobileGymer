import 'package:egtsv1/src/api/menu_gymer_api.dart';

import 'package:egtsv1/src/models/menu_gymer_model.dart';

class MenuGymerHandler {
  Future<MenuGymerModel> onFetMenuGymer(String dateTime, int mealTime) async {
    dateTime = dateTime.substring(0, 10);
    MenuGymerModel advMenuGymer =
        await MenuGymerAPI().fetchMenuGymerByDate(dateTime, mealTime);
    if (200 == advMenuGymer.code) {
      return advMenuGymer;
    }
    return MenuGymerModel();
  }
}
