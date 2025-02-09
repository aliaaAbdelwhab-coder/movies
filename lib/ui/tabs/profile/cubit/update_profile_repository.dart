import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/Register/register_modle.dart';
import 'package:movies/api/apiConstatnts.dart';
import 'package:movies/ui/tabs/profile/update_profile_model.dart';

class UpdateProfileRepository {
  Future<UpdateProfileModel> updateProfile({required int avaterId, required String name,required String phone ,required String token}) async {
    var url = Uri.https(Apiconstatnts.serverName, Apiconstatnts.updateProfileEndPoint); 

    try {
      final response = await http.patch(
        url,
        body: jsonEncode({
          "name": name,
          "phone": phone,
          "avaterId": avaterId,
        }),
        headers: {"Content-Type": "application/json",
        "Authorization": "Bearer $token",},
      );

      return UpdateProfileModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw Exception("Failed to update profile: $e");
    }
  }

  Future<void> deleteAccount(String token) async {
    var url = Uri.https(Apiconstatnts.serverName, Apiconstatnts.deleteAccountEndPoint); 

    try {
      final response = await http.delete(
        url,
        headers: {"Content-Type": "application/json" ,
                   "Authorization": "Bearer $token",
        },
      );

      return;
    } catch (e) {
      throw Exception("Error deleting account: $e");
    }
  }
}




