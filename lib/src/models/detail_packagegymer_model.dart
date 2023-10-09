class PackageGymer {
  int? code;
  String? message;
  List<DataPKGymer>? dataPKGymer;

  PackageGymer({this.code, this.message, this.dataPKGymer});

  PackageGymer.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is List) {
      dataPKGymer = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => DataPKGymer.fromJson(e)).toList();
    }
  }

  static List<PackageGymer> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => PackageGymer.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["message"] = message;
    if (dataPKGymer != null) {
      _data["data"] = dataPKGymer?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  PackageGymer copyWith({
    int? code,
    String? message,
    List<DataPKGymer>? data,
  }) =>
      PackageGymer(
        code: code ?? this.code,
        message: message ?? this.message,
        dataPKGymer: data ?? dataPKGymer,
      );
}

class DataPKGymer {
  String? id;
  String? name;
  String? gymerId;
  dynamic ptid;
  dynamic ptName;
  String? neid;
  String? neName;
  dynamic numberOfSession;
  int? numberOfMonth;
  String? from;
  String? to;
  String? status;
  bool? isDelete;
  bool? hasBodyParameter;

  DataPKGymer(
      {this.id,
      this.name,
      this.gymerId,
      this.ptid,
      this.ptName,
      this.neid,
      this.neName,
      this.numberOfSession,
      this.numberOfMonth,
      this.from,
      this.to,
      this.status,
      this.isDelete,
      this.hasBodyParameter});

  DataPKGymer.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["gymerId"] is String) {
      gymerId = json["gymerId"];
    }
    ptid = json["ptid"];
    ptName = json["ptName"];
    if (json["neid"] is String) {
      neid = json["neid"];
    }
    if (json["neName"] is String) {
      neName = json["neName"];
    }
    numberOfSession = json["numberOfSession"];
    if (json["numberOfMonth"] is int) {
      numberOfMonth = json["numberOfMonth"];
    }
    if (json["from"] is String) {
      from = json["from"];
    }
    if (json["to"] is String) {
      to = json["to"];
    }
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["isDelete"] is bool) {
      isDelete = json["isDelete"];
    }
    if (json["hasBodyParameter"] is bool) {
      hasBodyParameter = json["hasBodyParameter"];
    }
  }

  static List<DataPKGymer> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DataPKGymer.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["gymerId"] = gymerId;
    _data["ptid"] = ptid;
    _data["ptName"] = ptName;
    _data["neid"] = neid;
    _data["neName"] = neName;
    _data["numberOfSession"] = numberOfSession;
    _data["numberOfMonth"] = numberOfMonth;
    _data["from"] = from;
    _data["to"] = to;
    _data["status"] = status;
    _data["isDelete"] = isDelete;
    _data["hasBodyParameter"] = hasBodyParameter;
    return _data;
  }

  DataPKGymer copyWith({
    String? id,
    String? name,
    String? gymerId,
    dynamic ptid,
    dynamic ptName,
    String? neid,
    String? neName,
    dynamic numberOfSession,
    int? numberOfMonth,
    String? from,
    String? to,
    String? status,
    bool? isDelete,
    bool? hasBodyParameter,
  }) =>
      DataPKGymer(
        id: id ?? this.id,
        name: name ?? this.name,
        gymerId: gymerId ?? this.gymerId,
        ptid: ptid ?? this.ptid,
        ptName: ptName ?? this.ptName,
        neid: neid ?? this.neid,
        neName: neName ?? this.neName,
        numberOfSession: numberOfSession ?? this.numberOfSession,
        numberOfMonth: numberOfMonth ?? this.numberOfMonth,
        from: from ?? this.from,
        to: to ?? this.to,
        status: status ?? this.status,
        isDelete: isDelete ?? this.isDelete,
        hasBodyParameter: hasBodyParameter ?? this.hasBodyParameter,
      );
}
