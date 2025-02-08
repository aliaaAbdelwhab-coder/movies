import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/localization/localizationSatates.dart';

class LocalizationBloc extends Cubit<localizationState> {
  LocalizationBloc() : super(localizationState(local:"en"));

  void changeLocale(String locale) {
    
    emit(localizationState(local: locale));
  }
}
