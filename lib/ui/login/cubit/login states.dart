abstract class LoginStates{}

class InitialLoginState extends LoginStates{}

class LoadingLoginState extends LoginStates{}

class ErrorLoginState extends LoginStates{
  String errorMessage;
  ErrorLoginState({required this.errorMessage});
}

class SuccessLoginState extends LoginStates{
  String SuccessMessage;
  String data;
  SuccessLoginState({required this.SuccessMessage, required this.data});
}