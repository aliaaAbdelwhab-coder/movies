import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/api/api_manager.dart';
import 'package:movies/models/movie_response.dart';

import 'movie_state.dart';

class GetAllMoviesViewModel extends Cubit<HomeTabState> {
  ApiManager apiManager = ApiManager();

  GetAllMoviesViewModel() : super(HomeMoviesInitialState());

  List<MoviesData>? allMovies;
  int currentGenreIndex = 0;
  List<String> genres = [];

  // todo: hold data - handel logic
  Future<void> getAllMovies(String genres) async {
    try {
      emit(GetAllMoviesLoadingState());
      var response = await apiManager.getMovies(genre: genres);
      if (response!.status == 'ok') {
        allMovies = response.data?.movies ?? [];
        //genres = ;
        print(allMovies?.length);
        emit(GetAllMoviesSuccessState());
        print('----------------------------------------------------------');
        print('Loading all movies Success');
      } else {
        emit(GetAllMoviesErrorState(errorMessage: response.statusMessage!));
        print('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
        print('Failed to load allmovies');
      }
    } catch (e) {
      print('no internet');
      emit(GetAllMoviesErrorState(errorMessage: e.toString()));
      print(e);
    }
  }
}
