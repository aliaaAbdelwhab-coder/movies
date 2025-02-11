import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ui/forgot_password/cubit/forgot_password_states.dart';
import 'package:http/http.dart' as http;
import 'package:movies/ui/login/saveToken.dart';
import '../../../api/apiConstatnts.dart';
import '../fogotPasswordModel.dart';

class ForgotPasswordViewModel extends Cubit<ForgotPasswordStates> {
  ForgotPasswordViewModel() : super(InitialForgotPasswordState());

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  Future<void> resetPassword() async {
    if (formKey.currentState?.validate() == true) {
      var token = await getToken();
      emit(LoadingForgotPasswordState());
      var url = Uri.https(
          Apiconstatnts.serverName, Apiconstatnts.resetPasswordEndPoint);

      try {
        var response = await http.patch(url,
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token"
            },
            body: jsonEncode({
              "oldPassword": oldPasswordController.text,
              "newPassword": newPasswordController.text
            }));

        var json = jsonDecode(response.body);

        FogotPasswordModel forgotPasswordResponse =
            FogotPasswordModel.fromJson(json);

        if (forgotPasswordResponse.statusCode != null) {
          emit(ErrorForgotPasswordState(
              errorMessage: forgotPasswordResponse.message!));
        } else {
          emit(SuccessForgotPasswordState(
              SuccessMessage: forgotPasswordResponse.message!));
        }
      } catch (e) {
        emit(ErrorForgotPasswordState(errorMessage: e.toString()));
      }
    }
  }
}
