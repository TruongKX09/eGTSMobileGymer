import 'package:egtsv1/src/api/packagegymer_api.dart';

import '../models/detail_packagegymer_model.dart';

class PackageGymerHandler {
  Future<PackageGymer> onFetchPackageGymer() async {
    PackageGymer advPakageGymer = await PackageGymerAPI().fetchPackageGymer();
    if (200 == advPakageGymer.code) {
      advPakageGymer.dataPKGymer!.sort((a, b) {
        if (DateTime.parse(a.from!).isAfter(DateTime.parse(b.from!))) {
          return -1;
        }
        return 1;
      });
      advPakageGymer.dataPKGymer?.sort((a, b) {
        if (a.from != null && b.from != null) {
          if (DateTime.parse(a.from!).isAfter(DateTime.parse(b.from!))) {
            return -1;
          } else {
            return 1;
          }
        } else {
          return 0;
        }
      });
      return advPakageGymer;
    }
    return PackageGymer();
  }
}
