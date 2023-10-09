class RegisAccount {
  int? code = 0;
  String? message = "Oops!";
  DataUser? _data;

  RegisAccount({int? code, String? message, DataUser? data}) {
    if (code != null) {
      code = code;
    }
    if (message != null) {
      message = message;
    }
    if (data != null) {
      _data = data;
    }
  }
  DataUser? get data => _data;
  set data(DataUser? data) => _data = data;

  RegisAccount.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    _data = json['data'] != null ? DataUser.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (_data != null) {
      data['data'] = _data!.toJson();
    }
    return data;
  }
}

class LoginAccount {
  int? code = 0;
  String? message = "Oops!";
  DataUser? _data;
  String? _token;
  LoginAccount({int? code, String? message, DataUser? data, String? token}) {
    if (code != null) {
      code = code;
    }
    if (message != null) {
      message = message;
    }
    if (data != null) {
      _data = data;
    }
    if (token != null) {
      _token = token;
    }
  }

  DataUser? get data => _data;
  set data(DataUser? data) => _data = data;
  String? get token => _token;
  set token(String? token) => _token = token;

  LoginAccount.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    _data = json['data'] != null ? DataUser.fromJson(json['data']) : null;
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    if (_data != null) {
      map['data'] = _data!.toJson();
    }
    map['token'] = token;
    return map;
  }
}

class Account {
  int? code;
  String? message;
  List<DataUser>? data;

  Account({this.code, this.message, this.data});

  Account.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => DataUser.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["message"] = message;
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class DataUser {
  String? _id;
  String? _phoneNo;
  String? _password;
  String? _image;
  String? _fullname;
  String? _gender;
  String? _role;
  String? _createDate;
  bool? _isDelete;

  Data(
      {String? id,
      String? phoneNo,
      String? password,
      String? image,
      String? fullname,
      String? gender,
      String? role,
      String? createDate,
      bool? isDelete}) {
    if (id != null) {
      _id = id;
    }
    if (phoneNo != null) {
      _phoneNo = phoneNo;
    }
    if (password != null) {
      _password = password;
    }
    if (image != null) {
      _image = image;
    }
    if (fullname != null) {
      _fullname = fullname;
    }
    if (gender != null) {
      _gender = gender;
    }
    if (role != null) {
      _role = role;
    }
    if (createDate != null) {
      _createDate = createDate;
    }
    if (isDelete != null) {
      _isDelete = isDelete;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get phoneNo => _phoneNo;
  set phoneNo(String? phoneNo) => _phoneNo = phoneNo;
  String? get password => _password;
  set password(String? password) => _password = password;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get fullname => _fullname;
  set fullname(String? fullname) => _fullname = fullname;
  String? get gender => _gender;
  set gender(String? gender) => _gender = gender;
  String? get role => _role;
  set role(String? role) => _role = role;
  String? get createDate => _createDate;
  set createDate(String? createDate) => _createDate = createDate;
  bool? get isDelete => _isDelete;
  set isDelete(bool? isDelete) => _isDelete = isDelete;

  DataUser.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _phoneNo = json['phoneNo'];
    _password = json['password'];
    _image = json['image'];
    _fullname = json['fullname'];
    _gender = json['gender'];
    _role = json['role'];
    _createDate = json['createDate'];
    _isDelete = json['isDelete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phoneNo'] = _phoneNo;
    data['password'] = _password;
    data['image'] = _image;
    data['fullname'] = _fullname;
    data['gender'] = _gender;
    data['role'] = _role;
    return data;
  }
}

class UserInfo {
  String id = '';
  String name = '';

  UserInfo({
    required this.id,
    required this.name,
  });

  bool get isEmpty => id.isEmpty;

  UserInfo.empty();
}

UserInfo currentUser = UserInfo.empty();
const String cacheUserIDKey = 'cache_user_id_key';
