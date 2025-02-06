class LoginModel {
  String? message;
  String? data;
int? statusCode;

  LoginModel({
      this.message,
    this.statusCode,
      this.data,});

  LoginModel.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'];
    statusCode= json['statusCode'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusCode'] = statusCode;
    map['data'] = data;
    return map;
  }

}