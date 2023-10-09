class GeneralityGymer {
  int? code;
  String? message;
  List<DataGeneralitygymer>? dataGeneralityGymer;

  GeneralityGymer({this.code, this.message, this.dataGeneralityGymer});

  GeneralityGymer.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is List) {
      dataGeneralityGymer = json["data"] == null
          ? null
          : (json["data"] as List)
              .map((e) => DataGeneralitygymer.fromJson(e))
              .toList();
    }
  }

  static List<GeneralityGymer> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => GeneralityGymer.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["message"] = message;
    if (dataGeneralityGymer != null) {
      _data["data"] = dataGeneralityGymer?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  GeneralityGymer copyWith({
    int? code,
    String? message,
    List<DataGeneralitygymer>? data,
  }) =>
      GeneralityGymer(
        code: code ?? this.code,
        message: message ?? this.message,
        dataGeneralityGymer: data ?? dataGeneralityGymer,
      );
}

class DataGeneralitygymer {
  String? id;
  String? scheduleId;
  String? from;
  String? to;
  List<Excercises>? excercises;

  DataGeneralitygymer(
      {this.id, this.scheduleId, this.from, this.to, this.excercises});

  DataGeneralitygymer.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["scheduleId"] is String) {
      scheduleId = json["scheduleId"];
    }
    if (json["from"] is String) {
      from = json["from"];
    }
    if (json["to"] is String) {
      to = json["to"];
    }
    if (json["excercises"] is List) {
      excercises = json["excercises"] == null
          ? null
          : (json["excercises"] as List)
              .map((e) => Excercises.fromJson(e))
              .toList();
    }
  }

  static List<DataGeneralitygymer> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DataGeneralitygymer.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["scheduleId"] = scheduleId;
    _data["from"] = from;
    _data["to"] = to;
    if (excercises != null) {
      _data["excercises"] = excercises?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  DataGeneralitygymer copyWith({
    String? id,
    String? scheduleId,
    String? from,
    String? to,
    List<Excercises>? excercises,
  }) =>
      DataGeneralitygymer(
        id: id ?? this.id,
        scheduleId: scheduleId ?? this.scheduleId,
        from: from ?? this.from,
        to: to ?? this.to,
        excercises: excercises ?? this.excercises,
      );
}

class Excercises {
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

  Excercises(
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

  Excercises.fromJson(Map<String, dynamic> json) {
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

  static List<Excercises> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Excercises.fromJson(map)).toList();
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

  Excercises copyWith({
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
      Excercises(
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
