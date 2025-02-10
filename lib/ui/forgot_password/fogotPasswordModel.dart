/// message : "Password updated successfully"

class FogotPasswordModel {
  FogotPasswordModel({this.message, this.statusCode});

  FogotPasswordModel.fromJson(dynamic json) {
    message = json['message'];
    statusCode = json['statusCode'];
  }
  String? message;
  int? statusCode;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }
}
