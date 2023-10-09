class Profile {
  String? id;
  String? phoneNo;
  String? password;
  dynamic image;
  String? fullname;
  String? gender;
  String? role;
  String? createDate;
  bool? isDelete;

  Profile(
      {this.id,
      this.phoneNo,
      this.password,
      this.image,
      this.fullname,
      this.gender,
      this.role,
      this.createDate,
      this.isDelete});

  Profile.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["phoneNo"] is String) {
      phoneNo = json["phoneNo"];
    }
    if (json["password"] is String) {
      password = json["password"];
    }
    image = json["image"];
    if (json["fullname"] is String) {
      fullname = json["fullname"];
    }
    if (json["gender"] is String) {
      gender = json["gender"];
    }
    if (json["role"] is String) {
      role = json["role"];
    }
    if (json["createDate"] is String) {
      createDate = json["createDate"];
    }
    if (json["isDelete"] is bool) {
      isDelete = json["isDelete"];
    }
  }

  static List<Profile> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Profile.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["phoneNo"] = phoneNo;
    _data["password"] = password;
    _data["image"] = image;
    _data["fullname"] = fullname;
    _data["gender"] = gender;
    _data["role"] = role;
    _data["createDate"] = createDate;
    _data["isDelete"] = isDelete;
    return _data;
  }

  Profile copyWith({
    String? id,
    String? phoneNo,
    String? password,
    dynamic image,
    String? fullname,
    String? gender,
    String? role,
    String? createDate,
    bool? isDelete,
  }) =>
      Profile(
        id: id ?? this.id,
        phoneNo: phoneNo ?? this.phoneNo,
        password: password ?? this.password,
        image: image ?? this.image,
        fullname: fullname ?? this.fullname,
        gender: gender ?? this.gender,
        role: role ?? this.role,
        createDate: createDate ?? this.createDate,
        isDelete: isDelete ?? this.isDelete,
      );
}
