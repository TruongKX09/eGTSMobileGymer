class DetailExcerciseModel {
  int? code;
  String? message;
  DataDetailExcercisePT? dataDetailExcercisePT;

  DetailExcerciseModel({this.code, this.message, this.dataDetailExcercisePT});

  DetailExcerciseModel.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is Map) {
      dataDetailExcercisePT = json["data"] == null
          ? null
          : DataDetailExcercisePT.fromJson(json["data"]);
    }
  }

  static List<DetailExcerciseModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DetailExcerciseModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["message"] = message;
    if (dataDetailExcercisePT != null) {
      _data["data"] = dataDetailExcercisePT?.toJson();
    }
    return _data;
  }

  DetailExcerciseModel copyWith({
    int? code,
    String? message,
    DataDetailExcercisePT? data,
  }) =>
      DetailExcerciseModel(
        code: code ?? this.code,
        message: message ?? this.message,
        dataDetailExcercisePT: data ?? dataDetailExcercisePT,
      );
}

class DataDetailExcercisePT {
  String? id;
  String? ptid;
  String? name;
  String? description;
  String? video;
  int? calorieCumsumption;
  int? repTime;
  String? unitOfMeasurement;
  String? createDate;
  bool? isDelete;

  DataDetailExcercisePT(
      {this.id,
      this.ptid,
      this.name,
      this.description,
      this.video,
      this.calorieCumsumption,
      this.repTime,
      this.unitOfMeasurement,
      this.createDate,
      this.isDelete});

  DataDetailExcercisePT.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["ptid"] is String) {
      ptid = json["ptid"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["video"] is String) {
      video = json["video"];
    }
    if (json["calorieCumsumption"] is int) {
      calorieCumsumption = json["calorieCumsumption"];
    }
    if (json["repTime"] is int) {
      repTime = json["repTime"];
    }
    if (json["unitOfMeasurement"] is String) {
      unitOfMeasurement = json["unitOfMeasurement"];
    }
    if (json["createDate"] is String) {
      createDate = json["createDate"];
    }
    if (json["isDelete"] is bool) {
      isDelete = json["isDelete"];
    }
  }

  static List<DataDetailExcercisePT> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DataDetailExcercisePT.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["ptid"] = ptid;
    _data["name"] = name;
    _data["description"] = description;
    _data["video"] = video;
    _data["calorieCumsumption"] = calorieCumsumption;
    _data["repTime"] = repTime;
    _data["unitOfMeasurement"] = unitOfMeasurement;
    _data["createDate"] = createDate;
    _data["isDelete"] = isDelete;
    return _data;
  }

  DataDetailExcercisePT copyWith({
    String? id,
    String? ptid,
    String? name,
    String? description,
    String? video,
    int? calorieCumsumption,
    int? repTime,
    String? unitOfMeasurement,
    String? createDate,
    bool? isDelete,
  }) =>
      DataDetailExcercisePT(
        id: id ?? this.id,
        ptid: ptid ?? this.ptid,
        name: name ?? this.name,
        description: description ?? this.description,
        video: video ?? this.video,
        calorieCumsumption: calorieCumsumption ?? this.calorieCumsumption,
        repTime: repTime ?? this.repTime,
        unitOfMeasurement: unitOfMeasurement ?? this.unitOfMeasurement,
        createDate: createDate ?? this.createDate,
        isDelete: isDelete ?? this.isDelete,
      );
}
