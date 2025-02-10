import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/api/api_manager.dart';
import 'package:movies/ui/tabs/home/movei_details/cubit/movie_details_state.dart';

class MovieDetailsViewModel extends Cubit<MovieDetailsState> {
  ApiManager apiManager = ApiManager();
  int movieId;

  MovieDetailsViewModel({required this.movieId})
      : super(MoviesDetailsLoadingState());

  // todo: hold data - handel logic
  Future<void> getMovieDetails() async {
    try {
      emit(MoviesDetailsLoadingState());
      var response = await apiManager.getMovieDetails(movieId);
      if (response!.status == 'ok') {
        emit(MoviesDetailsSuccessState(movieDetails: response.data!));
        print('Loading movies Success');
      } else {
        emit(MoviesDetailsErrorState(errorMessage: response.statusMessage!));
        print('Failed to load movies');
      }
    } catch (e) {
      // print('no internet');
      emit(MoviesDetailsErrorState(errorMessage: e.toString()));
      print(e);
    }
  }
}
