import 'package:egtsv1/src/api/profile_api.dart';

import 'package:egtsv1/src/models/profile_model.dart';

class ProfileHandler {
  Future<Profile> onFetchProfile() async {
    Profile profileuser = await ProfileAPI().fetchProfile();

    return profileuser;
  }
}
