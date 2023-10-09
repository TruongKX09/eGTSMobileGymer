class AdPackage {
  int? code;
  String? message;
  List<DataAdPackage>? dataAdPackages;

  AdPackage({this.code, this.message, this.dataAdPackages});

  AdPackage.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is List) {
      dataAdPackages = json["data"] == null
          ? null
          : (json["data"] as List)
              .map((e) => DataAdPackage.fromJson(e))
              .toList();
    }
  }

  static List<AdPackage> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => AdPackage.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["message"] = message;
    if (dataAdPackages != null) {
      _data["data"] = dataAdPackages?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  AdPackage copyWith({
    int? code,
    String? message,
    List<DataAdPackage>? data,
  }) =>
      AdPackage(
        code: code ?? this.code,
        message: message ?? this.message,
        dataAdPackages: data ?? dataAdPackages,
      );
}

class DataAdPackage {
  String? id;
  String? name;
  bool? hasPt;
  bool? hasNe;
  dynamic numberOfsession;
  int? numberOfMonth;
  dynamic ptcost;
  int? necost;
  dynamic centerCost;
  int? price;
  int? originPrice;
  int? discount;
  String? createDate;
  bool? isDelete;

  DataAdPackage(
      {this.id,
      this.name,
      this.hasPt,
      this.hasNe,
      this.numberOfsession,
      this.numberOfMonth,
      this.ptcost,
      this.necost,
      this.centerCost,
      this.price,
      this.originPrice,
      this.discount,
      this.createDate,
      this.isDelete});

  DataAdPackage.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["hasPt"] is bool) {
      hasPt = json["hasPt"];
    }
    if (json["hasNe"] is bool) {
      hasNe = json["hasNe"];
    }
    numberOfsession = json["numberOfsession"];
    if (json["numberOfMonth"] is int) {
      numberOfMonth = json["numberOfMonth"];
    }
    ptcost = json["ptcost"];
    if (json["necost"] is int) {
      necost = json["necost"];
    }
    centerCost = json["centerCost"];
    if (json["price"] is int) {
      price = json["price"];
    }
    if (json["originPrice"] is int) {
      originPrice = json["originPrice"];
    }
    if (json["discount"] is int) {
      discount = json["discount"];
    }
    if (json["createDate"] is String) {
      createDate = json["createDate"];
    }
    if (json["isDelete"] is bool) {
      isDelete = json["isDelete"];
    }
  }

  static List<DataAdPackage> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DataAdPackage.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["hasPt"] = hasPt;
    _data["hasNe"] = hasNe;
    _data["numberOfsession"] = numberOfsession;
    _data["numberOfMonth"] = numberOfMonth;
    _data["ptcost"] = ptcost;
    _data["necost"] = necost;
    _data["centerCost"] = centerCost;
    _data["price"] = price;
    _data["originPrice"] = originPrice;
    _data["discount"] = discount;
    _data["createDate"] = createDate;
    _data["isDelete"] = isDelete;
    return _data;
  }

  DataAdPackage copyWith({
    String? id,
    String? name,
    bool? hasPt,
    bool? hasNe,
    dynamic numberOfsession,
    int? numberOfMonth,
    dynamic ptcost,
    int? necost,
    dynamic centerCost,
    int? price,
    int? originPrice,
    int? discount,
    String? createDate,
    bool? isDelete,
  }) =>
      DataAdPackage(
        id: id ?? this.id,
        name: name ?? this.name,
        hasPt: hasPt ?? this.hasPt,
        hasNe: hasNe ?? this.hasNe,
        numberOfsession: numberOfsession ?? this.numberOfsession,
        numberOfMonth: numberOfMonth ?? this.numberOfMonth,
        ptcost: ptcost ?? this.ptcost,
        necost: necost ?? this.necost,
        centerCost: centerCost ?? this.centerCost,
        price: price ?? this.price,
        originPrice: originPrice ?? this.originPrice,
        discount: discount ?? this.discount,
        createDate: createDate ?? this.createDate,
        isDelete: isDelete ?? this.isDelete,
      );
}
