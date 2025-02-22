import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/api/api_manager.dart';
import 'package:movies/models/movie_response.dart';

import 'movie_state.dart';


class MovieBlocViewModel extends Cubit<HomeTabState> {
  ApiManager apiManager = ApiManager();
    static Set<String> MoviesGenreSet = {};
  List<MoviesData>? availableMovies;

  MovieBlocViewModel() : super(HomeMoviesInitialState());

  // todo: hold data - handel logic
  Future<void> onGetMovies() async {
    try {
      emit(HomeMoviesLoadingState());
      var response = await apiManager.getMovies();
      if (response!.status == 'ok') {
        availableMovies = response.data?.movies ?? [];
        emit(HomeMoviesSuccessState(movies: response.data!.movies!));
        print('Loading movies Success');
      } else {
        emit(HomeMoviesErrorState(errorMessage: response.statusMessage!));
        print('Failed to load movies');
      }
    } catch (e) {
      // print('no internet');
      emit(HomeMoviesErrorState(errorMessage: e.toString()));
      print(e);
    }
  }
}
