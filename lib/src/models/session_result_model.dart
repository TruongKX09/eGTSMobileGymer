class SessionResultModel {
  int? code;
  String? message;
  List<DataSessionResult>? dataSessionResult;

  SessionResultModel({this.code, this.message, this.dataSessionResult});

  SessionResultModel.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is List) {
      dataSessionResult = json["data"] == null
          ? null
          : (json["data"] as List)
              .map((e) => DataSessionResult.fromJson(e))
              .toList();
    }
  }

  static List<SessionResultModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => SessionResultModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["message"] = message;
    if (dataSessionResult != null) {
      _data["data"] = dataSessionResult?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  SessionResultModel copyWith({
    int? code,
    String? message,
    List<DataSessionResult>? data,
  }) =>
      SessionResultModel(
        code: code ?? this.code,
        message: message ?? this.message,
        dataSessionResult: data ?? dataSessionResult,
      );
}

class DataSessionResult {
  String? id;
  String? sessionId;
  int? caloConsump;
  String? note;
  bool? isDelete;

  DataSessionResult(
      {this.id, this.sessionId, this.caloConsump, this.note, this.isDelete});

  DataSessionResult.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["sessionId"] is String) {
      sessionId = json["sessionId"];
    }
    if (json["caloConsump"] is int) {
      caloConsump = json["caloConsump"];
    }
    if (json["note"] is String) {
      note = json["note"];
    }
    if (json["isDelete"] is bool) {
      isDelete = json["isDelete"];
    }
  }

  static List<DataSessionResult> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DataSessionResult.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["sessionId"] = sessionId;
    _data["caloConsump"] = caloConsump;
    _data["note"] = note;
    _data["isDelete"] = isDelete;
    return _data;
  }

  DataSessionResult copyWith({
    String? id,
    String? sessionId,
    int? caloConsump,
    String? note,
    bool? isDelete,
  }) =>
      DataSessionResult(
        id: id ?? this.id,
        sessionId: sessionId ?? this.sessionId,
        caloConsump: caloConsump ?? this.caloConsump,
        note: note ?? this.note,
        isDelete: isDelete ?? this.isDelete,
      );
}
