import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Register/register_modle.dart';
import 'package:movies/ui/login/LoginModel.dart';
import 'package:movies/ui/login/saveToken.dart';
import 'package:movies/ui/tabs/profile/cubit/update_profile_repository.dart';
import 'package:movies/ui/tabs/profile/cubit/update_profile_states.dart';

class UpdateProfileBloc extends Cubit<UpdateProfileState> {
  UpdateProfileBloc() : super(UpdateProfileInitialState());
  UpdateProfileRepository repository = UpdateProfileRepository();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  LoginModel model = LoginModel();

  void updateProfile(int avatarId) async {
      String? token = await getToken();
    emit(UpdateProfileLoadingState());
    try {
      print("${model.data} =============================================");
      final user = await repository.updateProfile(
          avaterId: avatarId,
          name: nameController.text,
          phone: phoneController.text,
          token:token! );
      emit(UpdateProfileSuccessState(user));
    } catch (e) {
      emit(UpdateProfileErrorState(e.toString()));
    }
  }

  void deleteAccount() async {
    String? token = await getToken();
    emit(DeleteAccountLoadingState());
    try {
      await repository.deleteAccount(token!);
      emit(DeleteAccountSuccessState());
    } catch (e) {
      emit(DeleteAccountErrorState(e.toString()));
    }
  }
}
