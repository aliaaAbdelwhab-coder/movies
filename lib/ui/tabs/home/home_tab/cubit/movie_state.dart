

import 'package:movies/models/movie_response.dart';

abstract class MovieState {}

class MoviesInitialState extends MovieState {}

class MoviesLoadingState extends MovieState {}

class MoviesErrorState extends MovieState {
  String errorMessage;
  MoviesErrorState({required this.errorMessage});
}

class MoviesSuccessState extends MovieState {
  List<MoviesData> movies;

  MoviesSuccessState({required this.movies});
}
