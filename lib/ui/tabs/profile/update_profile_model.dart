import 'package:movies/Register/register_modle.dart';

class UpdateProfileModel {
  int? statusCode;
  String? message;
  String? error;

  UpdateProfileModel({
    required this.statusCode,
    required this.message,
    required this.error,
    
  });

  Map<String, dynamic> toJson() {
    return {
      "statusCode": statusCode,
        "message": message,
        "error": error,
    };
  }

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileModel(
      statusCode: json["statusCode"],
      message: json["message"],
      error: json["error"],
    );
  }
}
