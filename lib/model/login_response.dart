
class LoginResponse {
  bool? success;
  String? token;

  LoginResponse({this.success, this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    if(json["success"] is bool) {
      success = json["success"];
    }
    if(json["token"] is String) {
      token = json["token"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["token"] = token;
    return _data;
  }
}