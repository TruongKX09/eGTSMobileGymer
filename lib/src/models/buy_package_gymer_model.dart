class BuyPackageGymerModel {
  int? code;
  String? message;
  DataBuyPackage? dataBuyPackage;

  BuyPackageGymerModel({this.code, this.message, this.dataBuyPackage});

  BuyPackageGymerModel.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is Map) {
      dataBuyPackage =
          json["data"] == null ? null : DataBuyPackage.fromJson(json["data"]);
    }
  }

  static List<BuyPackageGymerModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => BuyPackageGymerModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["message"] = message;
    if (dataBuyPackage != null) {
      _data["data"] = dataBuyPackage?.toJson();
    }
    return _data;
  }

  BuyPackageGymerModel copyWith({
    int? code,
    String? message,
    DataBuyPackage? data,
  }) =>
      BuyPackageGymerModel(
        code: code ?? this.code,
        message: message ?? this.message,
        dataBuyPackage: data ?? dataBuyPackage,
      );
}

class DataBuyPackage {
  String? gymerId;
  String? packageId;

  DataBuyPackage({this.gymerId, this.packageId});

  DataBuyPackage.fromJson(Map<String, dynamic> json) {
    if (json["gymerID"] is String) {
      gymerId = json["gymerID"];
    }
    if (json["packageID"] is String) {
      packageId = json["packageID"];
    }
  }

  static List<DataBuyPackage> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DataBuyPackage.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["gymerID"] = gymerId;
    _data["packageID"] = packageId;
    return _data;
  }

  DataBuyPackage copyWith({
    String? gymerId,
    String? packageId,
  }) =>
      DataBuyPackage(
        gymerId: gymerId ?? this.gymerId,
        packageId: packageId ?? this.packageId,
      );
}
