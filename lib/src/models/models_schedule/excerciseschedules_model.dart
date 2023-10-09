class ExcerciseSchedule {
  int? code;
  String? message;
  List<Data>? data;

  ExcerciseSchedule({this.code, this.message, this.data});

  ExcerciseSchedule.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class Data {
  String? id;
  String? gymerId;
  String? ptid;
  String? packageGymerId;
  String? from;
  String? to;
  bool? isDeleted;

  Data(
      {this.id,
      this.gymerId,
      this.ptid,
      this.packageGymerId,
      this.from,
      this.to,
      this.isDeleted});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gymerId = json['gymerId'];
    ptid = json['ptid'];
    packageGymerId = json['packageGymerId'];
    from = json['from'];
    to = json['to'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['gymerId'] = gymerId;
    data['ptid'] = ptid;
    data['packageGymerId'] = packageGymerId;
    data['from'] = from;
    data['to'] = to;
    data['isDeleted'] = isDeleted;
    return data;
  }
}
