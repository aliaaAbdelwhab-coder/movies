import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ui/login/LoginModel.dart';
import 'package:movies/ui/login/cubit/login%20states.dart';
import 'package:http/http.dart' as http;
import 'package:movies/ui/login/saveToken.dart';
import '../../../api/apiConstatnts.dart';

class LoginViewModel extends Cubit<LoginStates> {
  LoginViewModel() : super(InitialLoginState());

  TextEditingController emailController =
      TextEditingController(text: 'aliaa@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: 'Aliaa1234@');
  var formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (formKey.currentState?.validate() == true) {
      emit(LoadingLoginState());
      var url =
          Uri.https(Apiconstatnts.serverName, Apiconstatnts.loginEndPoints);

      try {
        var response = await http.post(url,
            headers: {
              "Content-Type": "application/json",
            },
            body: jsonEncode({
              "email": emailController.text.trim(),
              "password": passwordController.text.trim()
            }));

        var json = jsonDecode(response.body);

        LoginModel loginResponse = LoginModel.fromJson(json);
        
        if (loginResponse.statusCode != null) {
          emit(ErrorLoginState(errorMessage: loginResponse.message!));
        } else {
          saveToken(loginResponse.data!);
          emit(SuccessLoginState(
            
              SuccessMessage: loginResponse.message!,
              data: loginResponse.data!));
        }
      } catch (e) {
        emit(ErrorLoginState(errorMessage: e.toString()));
      }
    }
  }
}
