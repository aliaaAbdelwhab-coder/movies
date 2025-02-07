import 'package:equatable/equatable.dart';

import '../../../../models/MovieResponse.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MoviesInitialState extends MovieState {}

class MoviesLoadingState extends MovieState {}

class MoviesErrorState extends MovieState {
  final String errorMessage;

  MoviesErrorState({required this.errorMessage});

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}

class MoviesSuccessState extends MovieState {
  final List<Movie> movies;

  const MoviesSuccessState({required this.movies});

  @override
  // TODO: implement props
  List<Object?> get props => [movies];
}
