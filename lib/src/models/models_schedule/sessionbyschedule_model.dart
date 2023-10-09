class SessionBySchedule {
  int? code;
  String? message;
  List<DataSession>? data;

  SessionBySchedule({this.code, this.message, this.data});

  SessionBySchedule.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataSession>[];
      json['data'].forEach((v) {
        data!.add(DataSession.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataSession {
  String? id;
  String? scheduleId;
  String? dateAndTime;
  bool? isDelete;

  DataSession({this.id, this.scheduleId, this.dateAndTime, this.isDelete});

  DataSession.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    scheduleId = json['scheduleId'];
    dateAndTime = json['dateAndTime'];
    isDelete = json['isDelete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['scheduleId'] = scheduleId;
    data['dateAndTime'] = dateAndTime;
    data['isDelete'] = isDelete;
    return data;
  }
}
