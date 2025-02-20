import 'package:movies/models/movie_response.dart';

abstract class BrowGetMoviessestates {}
class BrowseMoviesLoadingState extends BrowGetMoviessestates{}


  class BrowsMoviesErrorState extends BrowGetMoviessestates {
  String errorMessage;
  BrowsMoviesErrorState({required this.errorMessage});
}

class BrowseMoviesSuccessState extends BrowGetMoviessestates {
  List<MoviesData> movies;

  BrowseMoviesSuccessState({required this.movies});
}
