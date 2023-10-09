class GoalGymer {
  int? code;
  String? message;
  List<DataGoalGymer>? datagoalGymer;

  GoalGymer({this.code, this.message, this.datagoalGymer});

  GoalGymer.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is List) {
      datagoalGymer = json["data"] == null
          ? null
          : (json["data"] as List)
              .map((e) => DataGoalGymer.fromJson(e))
              .toList();
    }
  }

  static List<GoalGymer> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => GoalGymer.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["message"] = message;
    if (datagoalGymer != null) {
      _data["data"] = datagoalGymer?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  GoalGymer copyWith({
    int? code,
    String? message,
    List<DataGoalGymer>? data,
  }) =>
      GoalGymer(
        code: code ?? this.code,
        message: message ?? this.message,
        datagoalGymer: data ?? datagoalGymer,
      );
}

class DataGoalGymer {
  String? id;
  String? gymerId;
  String? goal;
  int? weight;
  int? height;
  double? bmi;
  dynamic bone;
  dynamic fat;
  dynamic muscle;
  String? createDate;
  bool? isDelete;

  DataGoalGymer(
      {this.id,
      this.gymerId,
      this.goal,
      this.weight,
      this.height,
      this.bmi,
      this.bone,
      this.fat,
      this.muscle,
      this.createDate,
      this.isDelete});

  DataGoalGymer.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
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
    if (json["bmi"] is double) {
      bmi = json["bmi"];
    }
    bone = json["bone"];
    fat = json["fat"];
    muscle = json["muscle"];
    if (json["createDate"] is String) {
      createDate = json["createDate"];
    }
    if (json["isDelete"] is bool) {
      isDelete = json["isDelete"];
    }
  }

  static List<DataGoalGymer> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DataGoalGymer.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["gymerId"] = gymerId;
    _data["goal"] = goal;
    _data["weight"] = weight;
    _data["height"] = height;
    _data["bmi"] = bmi;
    _data["bone"] = bone;
    _data["fat"] = fat;
    _data["muscle"] = muscle;
    _data["createDate"] = createDate;
    _data["isDelete"] = isDelete;
    return _data;
  }

  DataGoalGymer copyWith({
    String? id,
    String? gymerId,
    String? goal,
    int? weight,
    int? height,
    double? bmi,
    dynamic bone,
    dynamic fat,
    dynamic muscle,
    String? createDate,
    bool? isDelete,
  }) =>
      DataGoalGymer(
        id: id ?? this.id,
        gymerId: gymerId ?? this.gymerId,
        goal: goal ?? this.goal,
        weight: weight ?? this.weight,
        height: height ?? this.height,
        bmi: bmi ?? this.bmi,
        bone: bone ?? this.bone,
        fat: fat ?? this.fat,
        muscle: muscle ?? this.muscle,
        createDate: createDate ?? this.createDate,
        isDelete: isDelete ?? this.isDelete,
      );
}
