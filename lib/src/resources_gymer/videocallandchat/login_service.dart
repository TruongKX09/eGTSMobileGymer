import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'package:zego_zimkit/services/services.dart';

import '../../models/user_model.dart';
import 'common.dart';

ZegoUIKitPrebuiltCallController? callController;

Future<void> onloginSuccess({
  required String userID,
  required String userName,
}) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(cacheUserIDKey, userID);

  currentUser.id = userID.trim().replaceAll('-', '');
  currentUser.name = userName;
}

void onUserLogin() {
  callController ??= ZegoUIKitPrebuiltCallController();

  ZegoUIKitPrebuiltCallInvitationService().init(
    appID: 298518753,
    appSign: 'e0206a14f4d24de87c0f7f76766b8a2acf67580002693bbcca6466c72477121c',
    userID: currentUser.id,
    userName: currentUser.name,
    notifyWhenAppRunningInBackgroundOrQuit: true,
    plugins: [ZegoUIKitSignalingPlugin()],
    controller: callController,
    requireConfig: (ZegoCallInvitationData data) {
      final config = (data.invitees.length > 1)
          ? ZegoCallType.videoCall == data.type
              ? ZegoUIKitPrebuiltCallConfig.groupVideoCall()
              : ZegoUIKitPrebuiltCallConfig.groupVoiceCall()
          : ZegoCallType.videoCall == data.type
              ? ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
              : ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall();

      config.avatarBuilder = customAvatarBuilder;

      config.topMenuBarConfig.isVisible = true;
      config.topMenuBarConfig.buttons
          .insert(0, ZegoMenuBarButtonName.minimizingButton);

      return config;
    },
  );

  ZIMKit().connectUser(id: currentUser.id, name: currentUser.name);
}

void onUserLogout() {
  callController = null;

  ZegoUIKitPrebuiltCallInvitationService().uninit();
  ZIMKit().disconnectUser();
}
