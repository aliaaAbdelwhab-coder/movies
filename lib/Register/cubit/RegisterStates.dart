import 'package:movies/Register/register_modle.dart';

abstract class Registerstates {}

class ErrorState extends Registerstates {
  String errorMessage;
  ErrorState({required this.errorMessage});
}

class InitState extends Registerstates {}

class SucsessStates extends Registerstates {
  String sucsessMessage;
  Data data;
  SucsessStates({required this.sucsessMessage, required this.data});
 
}

class LoadingState extends Registerstates{}
