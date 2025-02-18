import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ui/tabs/browse/cubit/browse%20states.dart';

import '../../../../api/api_manager.dart';

class BrowseViewModel extends Cubit<BrowseStates>{
  ApiManager apiManager = ApiManager();

  BrowseViewModel():super(BrowseInitialState());

  Future<void> fetchGenres() async {
    emit(BrowseLoadingState());
    try {
      Set<String> genres = await apiManager.getMovieGenres();  // Calls getMovieGenres() from ApiManager
      emit(BrowseSuccessState(genres: genres));
    } catch (e) {
      emit(BrowseErrorState(errorMessage: e.toString()));
    }
  }



}