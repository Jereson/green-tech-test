
class InitiatePaymentResponse {
  bool? status;
  String? message;
  Data? data;

  InitiatePaymentResponse({this.status, this.message, this.data});

  InitiatePaymentResponse.fromJson(Map<String, dynamic> json) {
    if(json["status"] is bool) {
      status = json["status"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  String? authorizationUrl;
  String? accessCode;
  String? reference;

  Data({this.authorizationUrl, this.accessCode, this.reference});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["authorization_url"] is String) {
      authorizationUrl = json["authorization_url"];
    }
    if(json["access_code"] is String) {
      accessCode = json["access_code"];
    }
    if(json["reference"] is String) {
      reference = json["reference"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["authorization_url"] = authorizationUrl;
    _data["access_code"] = accessCode;
    _data["reference"] = reference;
    return _data;
  }
}