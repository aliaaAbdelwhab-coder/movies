import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../repository/movie_repository.dart';
import 'movie_state.dart';

part 'movie_event.dart';

@injectable
class MovieBlocViewModel extends Bloc<MovieEvent, MovieState> {
  MovieRepository moviesRepository;

  MovieBlocViewModel({required this.moviesRepository})
      : super(MoviesInitialState()) {
    on<GetMovies>(_onGetMovies);
  }

  // todo: hold data - handel logic
  Future<void> _onGetMovies(GetMovies event, Emitter<MovieState> emit) async {
    try {
      emit(MoviesLoadingState());
      var response = await moviesRepository.getMovies();
      if (response!.status == 'error') {
        emit(MoviesErrorState(errorMessage: response.statusMessage));
        return;
      }
      if (response.status == 'ok') {
        emit(MoviesSuccessState(movies: response.data.movies));
        return;
      }
    } catch (e) {
      emit(MoviesErrorState(errorMessage: e.toString()));
      return;
    }
  }
}
