class Suspends {
  int? code;
  String? message;
  dynamic targetSite;
  DataSuspends? dataSuspend;
  dynamic innerException;
  dynamic helpLink;
  dynamic source;
  int? hResult;
  dynamic stackTrace;

  Suspends(
      {this.code,
      this.message,
      this.targetSite,
      this.dataSuspend,
      this.innerException,
      this.helpLink,
      this.source,
      this.hResult,
      this.stackTrace});

  Suspends.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    targetSite = json["targetSite"];
    if (json["data"] is Map) {
      dataSuspend =
          json["data"] == null ? null : DataSuspends.fromJson(json["data"]);
    }
    innerException = json["innerException"];
    helpLink = json["helpLink"];
    source = json["source"];
    if (json["hResult"] is int) {
      hResult = json["hResult"];
    }
    stackTrace = json["stackTrace"];
  }

  static List<Suspends> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Suspends.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["message"] = message;
    _data["targetSite"] = targetSite;
    if (dataSuspend != null) {
      _data["data"] = dataSuspend?.toJson();
    }
    _data["innerException"] = innerException;
    _data["helpLink"] = helpLink;
    _data["source"] = source;
    _data["hResult"] = hResult;
    _data["stackTrace"] = stackTrace;
    return _data;
  }

  Suspends copyWith({
    int? code,
    String? message,
    dynamic targetSite,
    DataSuspends? data,
    dynamic innerException,
    dynamic helpLink,
    dynamic source,
    int? hResult,
    dynamic stackTrace,
  }) =>
      Suspends(
        code: code ?? this.code,
        message: message ?? this.message,
        targetSite: targetSite ?? this.targetSite,
        dataSuspend: data ?? dataSuspend,
        innerException: innerException ?? this.innerException,
        helpLink: helpLink ?? this.helpLink,
        source: source ?? this.source,
        hResult: hResult ?? this.hResult,
        stackTrace: stackTrace ?? this.stackTrace,
      );
}

class DataSuspends {
  DataSuspends();

  DataSuspends.fromJson(Map<String, dynamic> json) {}

  static List<DataSuspends> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DataSuspends.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};

    return _data;
  }
}
