class SessionExcercise {
  int? code;
  String? message;
  Data? data;

  SessionExcercise({this.code, this.message, this.data});

  SessionExcercise.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sessionID;
  String? sessionDateAndTime;
  List<ExcercisesInSession>? excercisesInSession;

  Data({this.sessionID, this.sessionDateAndTime, this.excercisesInSession});

  Data.fromJson(Map<String, dynamic> json) {
    sessionID = json['sessionID'];
    sessionDateAndTime = json['sessionDateAndTime'];
    if (json['excercisesInSession'] != null) {
      excercisesInSession = <ExcercisesInSession>[];
      json['excercisesInSession'].forEach((v) {
        excercisesInSession!.add(ExcercisesInSession.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sessionID'] = sessionID;
    data['sessionDateAndTime'] = sessionDateAndTime;
    if (excercisesInSession != null) {
      data['excercisesInSession'] =
          excercisesInSession!.map((v) => v.toJson()).toList();
    }
    return data;
  }
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
    id = json['id'];
    ptid = json['ptid'];
    name = json['name'];
    description = json['description'];
    video = json['video'];
    createDate = json['createDate'];
    isDelete = json['isDelete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ptid'] = ptid;
    data['name'] = name;
    data['description'] = description;
    data['video'] = video;
    data['createDate'] = createDate;
    data['isDelete'] = isDelete;
    return data;
  }
}
