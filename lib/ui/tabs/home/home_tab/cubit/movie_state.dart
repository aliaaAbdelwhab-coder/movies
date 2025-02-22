import 'package:movies/models/movie_response.dart';

abstract class HomeTabState {}

class HomeMoviesInitialState extends HomeTabState {}

/////////////// Available Movies //////////////////
class HomeMoviesLoadingState extends HomeTabState {}

class HomeMoviesErrorState extends HomeTabState {
  String errorMessage;

  HomeMoviesErrorState({required this.errorMessage});
}

class HomeMoviesSuccessState extends HomeTabState {
  List<MoviesData> movies;

  HomeMoviesSuccessState({required this.movies});
}

/////////////// All Movies //////////////////
class GetAllMoviesLoadingState extends HomeTabState {}

class GetAllMoviesErrorState extends HomeTabState {
  String errorMessage;

  GetAllMoviesErrorState({required this.errorMessage});
}

class GetAllMoviesSuccessState extends HomeTabState {
  final List<MoviesData>? allMovies;
  String? genres;

  GetAllMoviesSuccessState({
    this.allMovies,
    this.genres,
  });
}
