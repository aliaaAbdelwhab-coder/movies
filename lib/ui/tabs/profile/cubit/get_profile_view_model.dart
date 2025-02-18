import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movies/ui/login/saveToken.dart';
import 'package:movies/ui/tabs/profile/cubit/get_profile_states.dart';
import 'package:movies/ui/tabs/profile/get_profile_model.dart';

import '../../../../api/apiConstatnts.dart';

class GetProfileViewModel extends Cubit<GetProfileStates> {
  GetProfileViewModel() : super(InitialGetProfileState());

  Future<void> getProfileDetails() async {
    var token = await getToken();
    emit(LoadingGetProfileState());
    var url =
        Uri.https(Apiconstatnts.serverName, Apiconstatnts.getProfileEndPoint);

    try {
      var response = await http.get(url, headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      });
      var json = jsonDecode(response.body);

      GetProfileModel getProfileResponse = GetProfileModel.fromJson(json);

      if (getProfileResponse.statusCode != null) {
        emit(ErrorGetProfileState(errorMessage: getProfileResponse.message!));
      } else {
        emit(SuccessGetProfileState(profileModel: getProfileResponse));
      }
    } catch (e) {
      emit(ErrorGetProfileState(errorMessage: e.toString()));
    }
  }
}
