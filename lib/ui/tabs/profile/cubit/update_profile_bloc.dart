import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Register/register_modle.dart';
import 'package:movies/ui/tabs/profile/cubit/update_profile_repository.dart';
import 'package:movies/ui/tabs/profile/cubit/update_profile_states.dart';


class UpdateProfileBloc extends Cubit<UpdateProfileState> {
  final UpdateProfileRepository repository;

  UpdateProfileBloc(this.repository) : super(UpdateProfileInitialState());

  void updateProfile(int statusCode, String message, String error) async {
    emit(UpdateProfileLoadingState());
    try {
      final user = await repository.updateProfile(statusCode, message, error);
      emit(UpdateProfileSuccessState(user));
    } catch (e) {
      emit(UpdateProfileErrorState(e.toString()));
    }
  }

  void deleteAccount(String id) async {
    emit(DeleteAccountLoadingState());
    try {
      await repository.deleteAccount(id);
      emit(DeleteAccountSuccessState());
    } catch (e) {
      emit(DeleteAccountErrorState(e.toString()));
    }
  }
}
