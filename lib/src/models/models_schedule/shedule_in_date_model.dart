class ScheduleInDate {
  int? code;
  String? message;
  Data? data;

  ScheduleInDate({this.code, this.message, this.data});

  ScheduleInDate.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  static List<ScheduleInDate> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => ScheduleInDate.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["message"] = message;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }

  ScheduleInDate copyWith({
    int? code,
    String? message,
    Data? data,
  }) =>
      ScheduleInDate(
        code: code ?? this.code,
        message: message ?? this.message,
        data: data ?? this.data,
      );
}

class Data {
  String? sessionId;
  String? sessionDateAndTime;
  List<ExcercisesInSession>? excercisesInSession;

  Data({this.sessionId, this.sessionDateAndTime, this.excercisesInSession});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["sessionID"] is String) {
      sessionId = json["sessionID"];
    }
    if (json["sessionDateAndTime"] is String) {
      sessionDateAndTime = json["sessionDateAndTime"];
    }
    if (json["excercisesInSession"] is List) {
      excercisesInSession = json["excercisesInSession"] == null
          ? null
          : (json["excercisesInSession"] as List)
              .map((e) => ExcercisesInSession.fromJson(e))
              .toList();
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Data.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["sessionID"] = sessionId;
    _data["sessionDateAndTime"] = sessionDateAndTime;
    if (excercisesInSession != null) {
      _data["excercisesInSession"] =
          excercisesInSession?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  Data copyWith({
    String? sessionId,
    String? sessionDateAndTime,
    List<ExcercisesInSession>? excercisesInSession,
  }) =>
      Data(
        sessionId: sessionId ?? this.sessionId,
        sessionDateAndTime: sessionDateAndTime ?? this.sessionDateAndTime,
        excercisesInSession: excercisesInSession ?? this.excercisesInSession,
      );
}

class ExcercisesInSession {
  String? id;
  String? ptid;
  String? name;
  String? description;
  String? video;
  String? createDate;
  bool? isDelete;

  ExcercisesInSession(
      {this.id,
      this.ptid,
      this.name,
      this.description,
      this.video,
      this.createDate,
      this.isDelete});

  ExcercisesInSession.fromJson(Map<String, dynamic> json) {
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
    if (json["createDate"] is String) {
      createDate = json["createDate"];
    }
    if (json["isDelete"] is bool) {
      isDelete = json["isDelete"];
    }
  }

  static List<ExcercisesInSession> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => ExcercisesInSession.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["ptid"] = ptid;
    _data["name"] = name;
    _data["description"] = description;
    _data["video"] = video;
    _data["createDate"] = createDate;
    _data["isDelete"] = isDelete;
    return _data;
  }

  ExcercisesInSession copyWith({
    String? id,
    String? ptid,
    String? name,
    String? description,
    String? video,
    String? createDate,
    bool? isDelete,
  }) =>
      ExcercisesInSession(
        id: id ?? this.id,
        ptid: ptid ?? this.ptid,
        name: name ?? this.name,
        description: description ?? this.description,
        video: video ?? this.video,
        createDate: createDate ?? this.createDate,
        isDelete: isDelete ?? this.isDelete,
      );
}
