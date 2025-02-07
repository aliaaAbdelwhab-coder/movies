part of 'movie_bloc_view_model.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetMovies extends MovieEvent {}
