import '../get_profile_model.dart';

abstract class GetProfileStates {}

class InitialGetProfileState extends GetProfileStates {}

class LoadingGetProfileState extends GetProfileStates {}

class ErrorGetProfileState extends GetProfileStates {
  String errorMessage;

  ErrorGetProfileState({required this.errorMessage});
}

class SuccessGetProfileState extends GetProfileStates {
  GetProfileModel profileModel;

  SuccessGetProfileState({required this.profileModel});
}
