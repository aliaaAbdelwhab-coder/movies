import '../../../../../models/MovieDetailsResponse.dart';

abstract class MovieDetailsState {}

class MoviesDetailsInitialState extends MovieDetailsState {}

class MoviesDetailsLoadingState extends MovieDetailsState {}

class MoviesDetailsErrorState extends MovieDetailsState {
  String errorMessage;

  MoviesDetailsErrorState({required this.errorMessage});
}

class MoviesDetailsSuccessState extends MovieDetailsState {
  MovieDetails movieDetails;

  MoviesDetailsSuccessState({required this.movieDetails});
}
