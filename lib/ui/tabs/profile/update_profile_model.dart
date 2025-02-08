class UpdateProfileModel {
  final String id;
  final String name;
  final String phone;
  final String avatar;

  UpdateProfileModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.avatar,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "phone": phone,
      "avatar": avatar,
    };
  }

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileModel(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      avatar: json["avatar"],
    );
  }
}
