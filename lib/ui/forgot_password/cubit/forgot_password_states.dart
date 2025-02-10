abstract class ForgotPasswordStates{}

class InitialForgotPasswordState extends ForgotPasswordStates{}

class LoadingForgotPasswordState extends ForgotPasswordStates{}

class ErrorForgotPasswordState extends ForgotPasswordStates{
  String errorMessage;
  ErrorForgotPasswordState({required this.errorMessage});
}

class SuccessForgotPasswordState extends ForgotPasswordStates{
  String SuccessMessage;
  SuccessForgotPasswordState({required this.SuccessMessage});
}