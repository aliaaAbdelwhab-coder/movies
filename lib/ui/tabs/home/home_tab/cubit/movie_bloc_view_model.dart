import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/api/api_manager.dart';

import 'movie_state.dart';

part 'movie_event.dart';

@injectable
class MovieBlocViewModel extends Cubit<MovieState> {
  ApiManager apiManager = ApiManager();

  MovieBlocViewModel() : super(MoviesInitialState());

  // todo: hold data - handel logic
  Future<void> onGetMovies() async {
    try {
      emit(MoviesLoadingState());
      var response = await apiManager.getMovies();
      if (response!.status == 'ok') {
        emit(MoviesSuccessState(movies: response.data.movies));
        print('Loading movies Success');
      } else {
        emit(MoviesErrorState(errorMessage: response.statusMessage));
        print('Failed to load movies');
      }
    } catch (e) {
      // print('no internet');
      emit(MoviesErrorState(errorMessage: e.toString()));
      print(e);
    }
  }
}
