
class UserDetailModel {
  bool? success;
  Data? data;

  UserDetailModel({this.success, this.data});

  UserDetailModel.fromJson(Map<String, dynamic> json) {
    if(json["success"] is bool) {
      success = json["success"];
    }
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  String? id;
  String? name;
  String? email;
  int? phone;
  List<String>? roles;
  int? balance;
  String? createdAt;
  String? updatedAt;
  int? v;

  Data({this.id, this.name, this.email, this.phone, this.roles, this.balance, this.createdAt, this.updatedAt, this.v});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["phone"] is int) {
      phone = json["phone"];
    }
    if(json["roles"] is List) {
      roles = json["roles"] == null ? null : List<String>.from(json["roles"]);
    }
    if(json["balance"] is int) {
      balance = json["balance"];
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if(json["__v"] is int) {
      v = json["__v"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["phone"] = phone;
    if(roles != null) {
      _data["roles"] = roles;
    }
    _data["balance"] = balance;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}