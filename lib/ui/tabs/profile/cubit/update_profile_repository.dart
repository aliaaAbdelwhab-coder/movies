import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/ui/tabs/profile/update_profile_model.dart';

class UpdateProfileRepository {
  Future<UpdateProfileModel> updateProfile(String id, String name, String phone, String avatar) async {
    final response = await http.put(
      Uri.parse('https://route-movie-apis.vercel.app/profile'),
      body: jsonEncode({
        "id": id,
        "name": name,
        "phone": phone,
        "avatar": avatar,
      }),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      return UpdateProfileModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to update profile");
    }
  }

  Future<void> deleteAccount(String id) async {
    final response = await http.delete(
      Uri.parse('https://route-movie-apis.vercel.app/profile'),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to delete account");
    }
  }
}
