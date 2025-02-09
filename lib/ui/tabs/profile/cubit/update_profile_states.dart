import 'package:movies/ui/tabs/profile/update_profile_model.dart';

abstract class UpdateProfileState {}

class UpdateProfileInitialState extends UpdateProfileState {}

class UpdateProfileLoadingState extends UpdateProfileState {}

class UpdateProfileSuccessState extends UpdateProfileState {
  final UpdateProfileModel user;
  UpdateProfileSuccessState(this.user);
}

class UpdateProfileErrorState extends UpdateProfileState {
  final String error;
  UpdateProfileErrorState(this.error);
}

class DeleteAccountLoadingState extends UpdateProfileState {}

class DeleteAccountSuccessState extends UpdateProfileState {}

class DeleteAccountErrorState extends UpdateProfileState {
  final String error;
  DeleteAccountErrorState(this.error);
}
