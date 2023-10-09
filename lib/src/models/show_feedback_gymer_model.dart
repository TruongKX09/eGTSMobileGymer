class ShowFeedBackPtne {
  int? code;
  String? message;
  List<DataShowFeedBackPtne>? dataFeedBackPtne;

  ShowFeedBackPtne({this.code, this.message, this.dataFeedBackPtne});

  ShowFeedBackPtne.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is List) {
      dataFeedBackPtne = json["data"] == null
          ? null
          : (json["data"] as List)
              .map((e) => DataShowFeedBackPtne.fromJson(e))
              .toList();
    }
  }

  static List<ShowFeedBackPtne> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => ShowFeedBackPtne.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["message"] = message;
    if (dataFeedBackPtne != null) {
      _data["data"] = dataFeedBackPtne?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  ShowFeedBackPtne copyWith({
    int? code,
    String? message,
    List<DataShowFeedBackPtne>? data,
  }) =>
      ShowFeedBackPtne(
        code: code ?? this.code,
        message: message ?? this.message,
        dataFeedBackPtne: data ?? dataFeedBackPtne,
      );
}

class DataShowFeedBackPtne {
  String? id;
  String? ptidorNeid;
  String? packageGymerId;
  String? packageName;
  String? gymerName;
  String? ptOrNeName;
  int? rate;
  String? feedback1;
  bool? isDelete;

  DataShowFeedBackPtne(
      {this.id,
      this.ptidorNeid,
      this.packageGymerId,
      this.packageName,
      this.gymerName,
      this.ptOrNeName,
      this.rate,
      this.feedback1,
      this.isDelete});

  DataShowFeedBackPtne.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["ptidorNeid"] is String) {
      ptidorNeid = json["ptidorNeid"];
    }
    if (json["packageGymerId"] is String) {
      packageGymerId = json["packageGymerId"];
    }
    if (json["packageName"] is String) {
      packageName = json["packageName"];
    }
    if (json["gymerName"] is String) {
      gymerName = json["gymerName"];
    }
    if (json["ptOrNeName"] is String) {
      ptOrNeName = json["ptOrNeName"];
    }
    if (json["rate"] is int) {
      rate = json["rate"];
    }
    if (json["feedback1"] is String) {
      feedback1 = json["feedback1"];
    }
    if (json["isDelete"] is bool) {
      isDelete = json["isDelete"];
    }
  }

  static List<DataShowFeedBackPtne> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DataShowFeedBackPtne.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["ptidorNeid"] = ptidorNeid;
    _data["packageGymerId"] = packageGymerId;
    _data["packageName"] = packageName;
    _data["gymerName"] = gymerName;
    _data["ptOrNeName"] = ptOrNeName;
    _data["rate"] = rate;
    _data["feedback1"] = feedback1;
    _data["isDelete"] = isDelete;
    return _data;
  }

  DataShowFeedBackPtne copyWith({
    String? id,
    String? ptidorNeid,
    String? packageGymerId,
    String? packageName,
    String? gymerName,
    String? ptOrNeName,
    int? rate,
    String? feedback1,
    bool? isDelete,
  }) =>
      DataShowFeedBackPtne(
        id: id ?? this.id,
        ptidorNeid: ptidorNeid ?? this.ptidorNeid,
        packageGymerId: packageGymerId ?? this.packageGymerId,
        packageName: packageName ?? this.packageName,
        gymerName: gymerName ?? this.gymerName,
        ptOrNeName: ptOrNeName ?? this.ptOrNeName,
        rate: rate ?? this.rate,
        feedback1: feedback1 ?? this.feedback1,
        isDelete: isDelete ?? this.isDelete,
      );
}
