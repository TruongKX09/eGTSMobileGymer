import 'package:egtsv1/src/api/package_pt_api.dart';
import 'package:egtsv1/src/models/gym_pack_model.dart';

class PTPackageHandler {
  Future<AdPackage> onFetchAdvPackage() async {
    AdPackage advPakage = await PTPackAPI().fetchAdvPackage();
    if (200 == advPakage.code) {
      advPakage.dataAdPackages!.sort(
        (a, b) {
          if (DateTime.parse(a.createDate!)
              .isAfter(DateTime.parse(b.createDate!))) {
            return -1;
          }
          return 1;
        },
      );
      advPakage.dataAdPackages?.sort((a, b) {
        if (a.createDate != null && b.createDate != null) {
          if (DateTime.parse(a.createDate!)
              .isAfter(DateTime.parse(b.createDate!))) {
            return -1;
          } else {
            return 1;
          }
        } else {
          return 0;
        }
      });
      return advPakage;
    }
    return AdPackage();
  }
}
