class BodyParameter {
  int? code;
  String? message;
  DataBodyParameter? dataBodyParameter;

  BodyParameter({this.code, this.message, this.dataBodyParameter});

  BodyParameter.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is Map) {
      dataBodyParameter = json["data"] == null
          ? null
          : DataBodyParameter.fromJson(json["data"]);
    }
  }

  static List<BodyParameter> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => BodyParameter.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["message"] = message;
    if (dataBodyParameter != null) {
      _data["data"] = dataBodyParameter?.toJson();
    }
    return _data;
  }

  BodyParameter copyWith({
    int? code,
    String? message,
    DataBodyParameter? data,
  }) =>
      BodyParameter(
        code: code ?? this.code,
        message: message ?? this.message,
        dataBodyParameter: data ?? dataBodyParameter,
      );
}

class DataBodyParameter {
  String? gymerId;
  String? goal;
  int? weight;
  int? height;
  int? bone;
  int? fat;
  int? muscle;

  DataBodyParameter(
      {this.gymerId,
      this.goal,
      this.weight,
      this.height,
      this.bone,
      this.fat,
      this.muscle});

  DataBodyParameter.fromJson(Map<String, dynamic> json) {
    if (json["gymerId"] is String) {
      gymerId = json["gymerId"];
    }
    if (json["goal"] is String) {
      goal = json["goal"];
    }
    if (json["weight"] is int) {
      weight = json["weight"];
    }
    if (json["height"] is int) {
      height = json["height"];
    }
    if (json["bone"] is int) {
      bone = json["bone"];
    }
    if (json["fat"] is int) {
      fat = json["fat"];
    }
    if (json["muscle"] is int) {
      muscle = json["muscle"];
    }
  }

  static List<DataBodyParameter> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DataBodyParameter.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["gymerId"] = gymerId;
    _data["goal"] = goal;
    _data["weight"] = weight;
    _data["height"] = height;
    _data["bone"] = bone;
    _data["fat"] = fat;
    _data["muscle"] = muscle;
    return _data;
  }

  DataBodyParameter copyWith({
    String? gymerId,
    String? goal,
    int? weight,
    int? height,
    int? bone,
    int? fat,
    int? muscle,
  }) =>
      DataBodyParameter(
        gymerId: gymerId ?? this.gymerId,
        goal: goal ?? this.goal,
        weight: weight ?? this.weight,
        height: height ?? this.height,
        bone: bone ?? this.bone,
        fat: fat ?? this.fat,
        muscle: muscle ?? this.muscle,
      );
}
