import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Register/cubit/RegisterStates.dart';
import 'package:http/http.dart' as http;
import 'package:movies/Register/register_modle.dart';
import 'package:movies/api/apiConstatnts.dart';

class Registerviewmodle extends Cubit<Registerstates> {
  Registerviewmodle() : super(InitState());
  TextEditingController rePassController =
      TextEditingController(text: "Aliaa1234@");
  TextEditingController passController =
      TextEditingController(text: "Aliaa1234@");
  TextEditingController nameController = TextEditingController(text: "Aliaa4");
  TextEditingController emailController =
      TextEditingController(text: "aliaa4@gmail.com");
  TextEditingController phoneController =
      TextEditingController(text: "+201123456789");

  var formKey = GlobalKey<FormState>();
  void Register({required int avatarId}) async {
    if (formKey.currentState?.validate() == true) {
      emit(LoadingState());
      var url =
          Uri.https(Apiconstatnts.serverName, Apiconstatnts.loginEndPoints);

      try {
        var response = await http.post(url,
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({
              "name": nameController.text,
              "email": emailController.text,
              "password": passController.text,
              "confirmPassword": rePassController.text,
              "phone": phoneController.text,
              "avaterId": avatarId
            }));

        var json = jsonDecode(response.body);
        
        RegisterModle registerResponse = RegisterModle.fromJson(json);
        if (registerResponse.statusCode != null) {
          emit(ErrorState(errorMessage: registerResponse.message!));
        } else {
          emit(SucsessStates(
              sucsessMessage: registerResponse.message!,
              data: registerResponse.data!));
        }
      } catch (e) {
        emit(ErrorState(errorMessage: "$e"));
      }
    }
  }
}
