class CreateRequest {
  int? code;
  String? message;
  DataCreateRequest? dataCreateRequest;

  CreateRequest({this.code, this.message, this.dataCreateRequest});

  CreateRequest.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    dataCreateRequest =
        json['data'] != null ? DataCreateRequest.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (dataCreateRequest != null) {
      data['data'] = dataCreateRequest!.toJson();
    }
    return data;
  }
}

class DataCreateRequest {
  String? gymerId;
  String? receiverId;
  String? packageGymerId;
  bool? isPt;

  DataCreateRequest(
      {this.gymerId, this.receiverId, this.packageGymerId, this.isPt});

  DataCreateRequest.fromJson(Map<String, dynamic> json) {
    gymerId = json['gymerId'];
    receiverId = json['receiverId'];
    packageGymerId = json['packageGymerId'];
    isPt = json['isPt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gymerId'] = gymerId;
    data['receiverId'] = receiverId;
    data['packageGymerId'] = packageGymerId;
    data['isPt'] = isPt;
    return data;
  }
}
