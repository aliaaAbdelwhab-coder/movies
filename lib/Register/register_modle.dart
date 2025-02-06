class RegisterModle {
  int? statusCode;
  String? message;
  Data? data;

  RegisterModle({this.message, this.data, this.statusCode});

  RegisterModle.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
    statusCode = json["statusCode"];
  }

  static List<RegisterModle> fromList(List<Map<String, dynamic>> list) {
    return list.map(RegisterModle.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    _data["statusCode"] = statusCode;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  String? email;
  String? password;
  String? name;
  String? phone;
  int? avaterId;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;

  Data(
      {this.email,
      this.password,
      this.name,
      this.phone,
      this.avaterId,
      this.id,
      this.createdAt,
      this.updatedAt,
      this.v});

  Data.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    password = json["password"];
    name = json["name"];
    phone = json["phone"];
    avaterId = json["avaterId"];
    id = json["_id"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["email"] = email;
    _data["password"] = password;
    _data["name"] = name;
    _data["phone"] = phone;
    _data["avaterId"] = avaterId;
    _data["_id"] = id;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}
