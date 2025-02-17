/// message : "Profile fetched successfully"
/// data : {"_id":"67a917baaa32b988ebb62898","email":"Mina@gmail.com","password":"$2b$10$xgYAzqor4oQbFc41J2qvcuYlLW7f1totHr.6R1JZa/lk7jdBVhaL6","name":"Mina ","phone":"+201123456789","avaterId":0,"createdAt":"2025-02-09T21:01:46.857Z","updatedAt":"2025-02-10T14:31:00.874Z","__v":0}

class GetProfileModel {
  GetProfileModel({this.message, this.data, this.statusCode, this.error});

  GetProfileModel.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    statusCode = json['statusCode'];
    error = json['error'];
  }

  String? message;
  Data? data;
  int? statusCode;
  String? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

/// _id : "67a917baaa32b988ebb62898"
/// email : "Mina@gmail.com"
/// password : "$2b$10$xgYAzqor4oQbFc41J2qvcuYlLW7f1totHr.6R1JZa/lk7jdBVhaL6"
/// name : "Mina "
/// phone : "+201123456789"
/// avaterId : 0
/// createdAt : "2025-02-09T21:01:46.857Z"
/// updatedAt : "2025-02-10T14:31:00.874Z"
/// __v : 0

class Data {
  Data({
    this.id,
    this.email,
    this.password,
    this.name,
    this.phone,
    this.avaterId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Data.fromJson(dynamic json) {
    id = json['_id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    phone = json['phone'];
    avaterId = json['avaterId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  String? id;
  String? email;
  String? password;
  String? name;
  String? phone;
  int? avaterId;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['email'] = email;
    map['password'] = password;
    map['name'] = name;
    map['phone'] = phone;
    map['avaterId'] = avaterId;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}
