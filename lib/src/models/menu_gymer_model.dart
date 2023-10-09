class MenuGymerModel {
  int? code;
  String? message;
  List<DataMenu>? dataMenu;

  MenuGymerModel({this.code, this.message, this.dataMenu});

  MenuGymerModel.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is List) {
      dataMenu = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => DataMenu.fromJson(e)).toList();
    }
  }

  static List<MenuGymerModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => MenuGymerModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["message"] = message;
    if (dataMenu != null) {
      _data["data"] = dataMenu?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  MenuGymerModel copyWith({
    int? code,
    String? message,
    List<DataMenu>? data,
  }) =>
      MenuGymerModel(
        code: code ?? this.code,
        message: message ?? this.message,
        dataMenu: data ?? dataMenu,
      );
}

class DataMenu {
  String? id;
  String? nutritionScheduleId;
  int? mealTime;
  String? datetime;
  bool? isDelete;
  List<FoodAndSuppliment>? foodAndSuppliment;

  DataMenu(
      {this.id,
      this.nutritionScheduleId,
      this.mealTime,
      this.datetime,
      this.isDelete,
      this.foodAndSuppliment});

  DataMenu.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["nutritionScheduleId"] is String) {
      nutritionScheduleId = json["nutritionScheduleId"];
    }
    if (json["mealTime"] is int) {
      mealTime = json["mealTime"];
    }
    if (json["datetime"] is String) {
      datetime = json["datetime"];
    }
    if (json["isDelete"] is bool) {
      isDelete = json["isDelete"];
    }
    if (json["foodAndSuppliment"] is List) {
      foodAndSuppliment = json["foodAndSuppliment"] == null
          ? null
          : (json["foodAndSuppliment"] as List)
              .map((e) => FoodAndSuppliment.fromJson(e))
              .toList();
    }
  }

  static List<DataMenu> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DataMenu.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["nutritionScheduleId"] = nutritionScheduleId;
    _data["mealTime"] = mealTime;
    _data["datetime"] = datetime;
    _data["isDelete"] = isDelete;
    if (foodAndSuppliment != null) {
      _data["foodAndSuppliment"] =
          foodAndSuppliment?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  DataMenu copyWith({
    String? id,
    String? nutritionScheduleId,
    int? mealTime,
    String? datetime,
    bool? isDelete,
    List<FoodAndSuppliment>? foodAndSuppliment,
  }) =>
      DataMenu(
        id: id ?? this.id,
        nutritionScheduleId: nutritionScheduleId ?? this.nutritionScheduleId,
        mealTime: mealTime ?? this.mealTime,
        datetime: datetime ?? this.datetime,
        isDelete: isDelete ?? this.isDelete,
        foodAndSuppliment: foodAndSuppliment ?? this.foodAndSuppliment,
      );
}

class FoodAndSuppliment {
  String? id;
  String? neid;
  String? name;
  int? ammount;
  String? unitOfMesuament;
  int? calories;
  String? createDate;
  bool? isDelete;

  FoodAndSuppliment(
      {this.id,
      this.neid,
      this.name,
      this.ammount,
      this.unitOfMesuament,
      this.calories,
      this.createDate,
      this.isDelete});

  FoodAndSuppliment.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["neid"] is String) {
      neid = json["neid"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["ammount"] is int) {
      ammount = json["ammount"];
    }
    if (json["unitOfMesuament"] is String) {
      unitOfMesuament = json["unitOfMesuament"];
    }
    if (json["calories"] is int) {
      calories = json["calories"];
    }
    if (json["createDate"] is String) {
      createDate = json["createDate"];
    }
    if (json["isDelete"] is bool) {
      isDelete = json["isDelete"];
    }
  }

  static List<FoodAndSuppliment> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => FoodAndSuppliment.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["neid"] = neid;
    _data["name"] = name;
    _data["ammount"] = ammount;
    _data["unitOfMesuament"] = unitOfMesuament;
    _data["calories"] = calories;
    _data["createDate"] = createDate;
    _data["isDelete"] = isDelete;
    return _data;
  }

  FoodAndSuppliment copyWith({
    String? id,
    String? neid,
    String? name,
    int? ammount,
    String? unitOfMesuament,
    int? calories,
    String? createDate,
    bool? isDelete,
  }) =>
      FoodAndSuppliment(
        id: id ?? this.id,
        neid: neid ?? this.neid,
        name: name ?? this.name,
        ammount: ammount ?? this.ammount,
        unitOfMesuament: unitOfMesuament ?? this.unitOfMesuament,
        calories: calories ?? this.calories,
        createDate: createDate ?? this.createDate,
        isDelete: isDelete ?? this.isDelete,
      );
}
